-- where you set up legendary.nvim
-- now the keymaps from plugins.lua plugin spec will be automatically loaded
require("legendary").setup({
	keymaps = {
		{ "<leader>lh", ":Legendary<CR>", desc = "Show legendary command palette" },
		{ "<leader>tp", ":tabprevious<CR>", desc = "Previous tab" },
		{ "<leader>tn", ":tabnext<CR>", desc = "Next tab" },
		{ "<leader>te", ":tabedit<space>", desc = "Open path in new tab" },
		{ "<leader>b", ":bd<CR>", desc = "Delete current buffer" },
		{ "K", require("hover").hover, desc = "hover.nvim" },
		{ "gK", require("hover").hover_select, desc = "hover.nvim (select)" },
		{ "<MouseMove>", require("hover").hover_mouse, desc = "hover.nvim (mouse)" },
	},
	extensions = { lazy_nvim = true, nvim_tree = true },
})

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})
