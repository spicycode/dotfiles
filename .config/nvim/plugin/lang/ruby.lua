require("lazyload").on_vim_enter(function()
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("ruby-opts", { clear = true }),
		pattern = "ruby",
		callback = function() end,
	})

	vim.pack.add({
		{ src = "https://github.com/folke/lazydev.nvim", version = vim.version.range("*") },
		{ src = "https://github.com/Bilal2453/luvit-meta" }, -- vim.uv typings
		{ src = "https://github.com/jbyuki/one-small-step-for-vimkind" }, -- Lua DAP adapter
	})
end)
