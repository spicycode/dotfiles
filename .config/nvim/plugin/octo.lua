require("lazyload").on_vim_enter(function()
	vim.pack.add({
		{ src = "https://github.com/pwntester/octo.nvim" },
	})
	require("octo").setup({
		picker = "snacks",
		file_panel = {
			icons = function(name, _ext)
				return require("mini.icons").get("file", name)
			end,
		},
	})
	-- Enable markdown in octo.nvim
	vim.treesitter.language.register("markdown", "octo")
end)
