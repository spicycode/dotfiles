require("nvim-lsp-installer").setup {}
require("lspconfig")

local lsp = {}
vim.g.cursorhold_updatetime = 100

-- Show source in diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Or "if_many"
  },
  float = {
    source = "always", -- Or "if_many"
  },
})

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  -- Declaration and definition
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

  -- Docs
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>od", "<cmd>lua vim.diagnostic.open_float({ border='single'})<CR>",
    opts)

  -- Diagnostic
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float={ border='single' }})<CR>",
    opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float={ border='single' }})<CR>",
    opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  if client.resolved_capabilities.document_highlight then
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
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
  vim.keymap.set('n', '<Leader>ld',
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    { buffer = true, silent = true })
  vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>',
    { buffer = true, silent = true })
  vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>",
    { buffer = true, silent = true })
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>',
    { buffer = true, silent = true })

  vim.wo.signcolumn = 'yes'
end

lsp.init = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- UI tweaks from https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
  local border = {
    { "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" },
    { "│", "FloatBorder" }, { "╯", "FloatBorder" }, { "─", "FloatBorder" },
    { "╰", "FloatBorder" }, { "│", "FloatBorder" }
  }
  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
      { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
      .signature_help,
      { border = border })
  }

  local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if has_cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end

  local cmd = 'lua-language-server'
  if vim.fn.executable(cmd) == 1 then
    cmd = { cmd }
  else
    cmd = nil
  end

  if cmd ~= nil then
    -- Prerequisite: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
    require 'lspconfig'.sumneko_lua.setup {
      capabilities = capabilities,
      cmd = cmd,
      handlers = handlers,
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
  end

  require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach
  }

  require 'lspconfig'.eslint.setup {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach
  }

  require 'lspconfig'.graphql.setup {}
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
