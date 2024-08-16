require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls", "graphql", "lua_ls", "tsserver",
    "html", "jsonls", "marksman", "yamlls",
    "eslint", "pylsp", "rust_analyzer",
    "bashls", "taplo", "sorbet"
  }
})
local lspconfig = require("lspconfig")

vim.g.cursorhold_updatetime = 100

local on_attach = function(client, bufnr)
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

  -- Disable semantic token provider so it doesn't mess with Treesitter
  client.server_capabilities.semanticTokensProvider = nil

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

lspconfig.ruby_lsp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.marksman.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.pylsp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.taplo.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.hls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.sorbet.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require("hover").setup {
  init = function()
    -- Require providers
    require("hover.providers.lsp")
    require('hover.providers.gh')
    require('hover.providers.gh_user')
    -- require('hover.providers.jira')
    require('hover.providers.man')
    -- require('hover.providers.dictionary')
  end,
  preview_opts = {
    border = nil
  },
  -- Whether the contents of a currently open hover window should be moved
  -- to a :h preview-window when pressing the hover keymap.
  preview_window = false,
  title = true
}

require('ts-error-translator').setup()
