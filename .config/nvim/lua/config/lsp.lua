require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "graphql", "sumneko_lua", "tsserver" }
})
require("lspconfig")

local lsp = {}
vim.g.cursorhold_updatetime = 100

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

local function lsp_keymaps(bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.server_capabilities.document_highlight then
    vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=black guibg=black
      hi! LspReferenceText cterm=bold ctermbg=black guibg=black
      hi! LspReferenceWrite cterm=bold ctermbg=black guibg=black
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  vim.wo.signcolumn = 'yes'
end

lsp.init = function()

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- UI tweaks from https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
  local border = {
    { "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" },
    { "│", "FloatBorder" }, { "╯", "FloatBorder" }, { "─", "FloatBorder" },
    { "╰", "FloatBorder" }, { "│", "FloatBorder" }
  }

  local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if has_cmp_nvim_lsp then
    capabilities.textDocument.semanticHighlighting = true
    capabilities.offsetEncoding = "utf-8"
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
  end

  -- Prerequisite: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
  require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    cmd = cmd,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = { enable = true, globals = { 'vim' } },
        filetypes = { 'lua' },
        runtime = {
          path = vim.split(package.path, ';'),
          version = 'LuaJIT'
        }
      }
    }
  }

  require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.graphql.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

lsp.set_up_highlights = function()
  local pinnacle = require 'pinnacle'

  vim.cmd('highlight DiagnosticError ' ..
    pinnacle.decorate('italic,underline', 'ModeMsg'))

  vim.cmd('highlight DiagnosticHint ' ..
    pinnacle.decorate('bold,italic,underline', 'Type'))

  vim.cmd('highlight DiagnosticSignHint ' .. pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('Type')
  }))

  vim.cmd('highlight DiagnosticSignError ' .. pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('ErrorMsg')
  }))

  vim.cmd('highlight DiagnosticSignInformation ' .. pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('DiagnosticHint')
  }))

  vim.cmd('highlight DiagnosticSignWarning ' .. pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('DiagnosticHint')
  }))
end

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

require('nvim-lightbulb').setup({ autocmd = { enabled = true } })

require "fidget".setup {}

return lsp
