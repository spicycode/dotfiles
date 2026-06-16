require("lazyload").on_vim_enter(function()
	vim.pack.add({
		{ src = "https://github.com/pwntester/octo.nvim" },
	})
	require("octo").setup()
	-- Enable markdown in octo.nvim
	vim.treesitter.language.register("markdown", "octo")
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	cmd = "Octo",
	-- }
end)
