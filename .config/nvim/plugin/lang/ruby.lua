require("lazyload").on_vim_enter(function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "OilEnter",
		callback = function()
			if vim.fn["RailsDetect"](vim.fn.getcwd()) then
				vim.fn["rails#buffer_setup"]()
			end
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("ruby-opts", { clear = true }),
		pattern = "ruby",
		callback = function() end,
	})

	vim.pack.add({
		{ src = "https://github.com/vim-ruby/vim-ruby" },
		{ src = "https://github.com/tpope/vim-rails" },
	})
end)
