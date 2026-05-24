require("lazyload").on_vim_enter(function()
	-- filetypes
	do
		vim.filetype.add({
			extension = {
				gotmpl = "gotmpl",
				gohtml = "gotmpl",
			},
			pattern = {
				[".*%.go%.tmpl"] = "gotmpl",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go", "gomod", "gowork", "gohtml", "gotmpl" },
			callback = function()
				vim.opt_local.expandtab = false
			end,
		})
	end

	-- tree-sitter dependent plugins
	do
		if Config.use_treesitter_parser then
			vim.pack.add({
				{ src = "https://github.com/maxandron/goplements.nvim" },
			})
			require("goplements").setup()

			vim.pack.add({
				{ src = "https://github.com/edte/blink-go-import.nvim" },
			})
			require("blink-go-import").setup()
		end
	end

	-- go-impl (uses "impl" from mason and "symbolScope", "symbolMatcher" setting in gopls)
	do
		vim.pack.add({
			{ src = "https://github.com/fang2hou/go-impl.nvim", version = vim.version.range("*") },
			{ src = "https://github.com/MunifTanjim/nui.nvim", version = vim.version.range("*") },
		})
		require("go-impl").setup({
			picker = "snacks",
			insert = {
				position = "after",
				before_newline = true,
				after_newline = false,
			},
		})
	end
end)
