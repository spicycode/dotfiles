require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "graphql", "sumneko_lua", "tsserver", "ruby_ls", "html", "jsonls", "marksman", "yamlls", "eslint" }
})
require("lspconfig")

local lsp = {}
vim.g.cursorhold_updatetime = 100

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

local on_attach = function(client, bufnr)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])

  if client.server_capabilities.document_highlight then
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
  local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  local capabilities = cmp_nvim_lsp.default_capabilities()

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
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
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

  require 'lspconfig'.ruby_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.yamlls.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  require 'lspconfig'.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

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

require "fidget".setup {
  window = {
    blend = 0,
  },
}

return lsp
