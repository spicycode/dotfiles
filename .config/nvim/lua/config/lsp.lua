require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"eslint",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"lemminx",
		"lua_ls",
		"marksman",
		"pylsp",
		"sorbet",
		"taplo",
		"terraformls",
		"ts_ls",
		"yamlls",
		"starpls",
		"vale_ls",
	},
})
local lspconfig = require("lspconfig")

vim.g.cursorhold_updatetime = 100

local on_attach = function(client, bufnr)
	if client.server_capabilities.document_highlight then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

	-- Disable semantic token provider so it doesn't mess with Treesitter
	client.server_capabilities.semanticTokensProvider = nil

	vim.wo.signcolumn = "yes"
end

local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities(base_capabilities)

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			telemetry = {
				-- Do not send telemetry data containing a randomized but unique identifier
				enable = false,
			},
		},
	},
	on_init = function(client)
		local join = vim.fs.joinpath
		local path = client.workspace_folders[1].name

		-- Don't do anything if there is project local config
		if vim.uv.fs_stat(join(path, ".luarc.json")) or vim.uv.fs_stat(join(path, ".luarc.jsonc")) then
			return
		end

		-- Apply neovim specific settings
		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, join("lua", "?.lua"))
		table.insert(runtime_path, join("lua", "?", "init.lua"))

		local nvim_settings = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					-- Make the server aware of Neovim runtime files
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
			},
		}

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, nvim_settings)
	end,
})

-- All of the LSP servers I use that don't need anything but factory config.
local lsp_servers_with_default_config = {
	"vale_ls",
	"starpls",
	"ts_ls",
	"graphql",
	"gopls",
	"ruby_lsp",
	"html",
	"marksman",
	"pylsp",
	"html",
	"eslint",
	"jsonls",
	"bashls",
	"taplo",
	"hls",
	"sorbet",
	"clangd",
	"lemminx",
	"terraformls",
}

for _, lsp in ipairs(lsp_servers_with_default_config) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})
