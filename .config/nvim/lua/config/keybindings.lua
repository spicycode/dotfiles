local keymap = vim.keymap.set
local ts_builtin = require("telescope.builtin")

-- where you set up legendary.nvim
-- now the keymaps from plugins.lua plugin spec will be automatically loaded
require("legendary").setup({
  keymaps = {
    { "<leader>lh",  ":Legendary<CR>",              desc = "Show legendary command palette" },
    { "<leader>tp",  ":tabprevious<CR>",            desc = "Previous tab" },
    { "<leader>tn",  ":tabnext<CR>",                desc = "Next tab" },
    { "<leader>te",  ":tabedit<space>",             desc = "Open path in new tab" },
    { "<leader>b",   ":bd<CR>",                     desc = "Delete current buffer" },
    { "K",           require("hover").hover,        desc = "hover.nvim" },
    { "gK",          require("hover").hover_select, desc = "hover.nvim (select)" },
    { "<MouseMove>", require("hover").hover_mouse,  desc = "hover.nvim (mouse)" },
  },
  extensions = { lazy_nvim = true }
})
