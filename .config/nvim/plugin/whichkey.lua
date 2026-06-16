require("lazyload").on_vim_enter(function()
	vim.pack.add({
		{ src = "https://github.com/folke/which-key.nvim", version = vim.version.range("*") },
	})

	require("which-key").setup({
		-- based on preset = "helix",
		win = {
			width = { min = 30, max = 60 },
			height = { min = 4, max = 0.75 },
			padding = { 0, 1 },
			col = -1,
			row = 11,
			border = "rounded",
			title = true,
			title_pos = "left",
		},
		layout = {
			width = { min = 30 },
		},
	})

	require("which-key").add({
		{ "<leader>t", group = "tab" },
		{ "<leader>l", group = "find or list" },
		{ "<leader>a", group = "ai" },
		{ "<leader>c", group = "code" },
		{ "<leader>d", group = "debug" },
		{ "<leader>dL", group = "debug lua" },
		{ "<leader>n", group = "notes" },
		{ "<leader>g", group = "git" },
		{ "<leader>gb", group = "blame" },
		{ "<leader>gd", group = "diffview" },
		{ "<leader>gh", group = "hunks" },
		{ "<leader>r", group = "run" },
		{ "<leader>s", group = "search" },
		{ "<leader><tab>", group = "test" },
		{ "<leader>u", group = "ui" },
		{ "<leader>x", group = "diagnostics/quickfix" },
		{ "<leader>w", group = "windows", proxy = "<C-w>" },
		{
			"<leader>b",
			group = "buffers",
			expand = function()
				return require("which-key.extras").expand.buf()
			end,
		},
	})
end)
