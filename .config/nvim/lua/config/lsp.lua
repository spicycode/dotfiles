require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls", "graphql", "lua_ls", "tsserver",
    "ruby_ls", "html", "jsonls", "marksman", "yamlls",
    "eslint"
  }
})
local lspconfig = require("lspconfig")

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

require "fidget".setup {
  window = {
    blend = 0,
  },
}

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

lspconfig.lua_ls.setup {
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

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.graphql.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.ruby_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.marksman.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
