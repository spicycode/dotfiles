local keymap = vim.keymap.set

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })
keymap("n", "<C-]>", ":Telescope tags<CR>", { silent = true })
keymap("n", "<leader>lb", ":Telescope buffers<CR>", { silent = true })
keymap("n", "<leader>lt", ":Telescope help_tags<CR>", { silent = true })
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { silent = true })

-- Bring up co-authors list, it inserts and adds a CR after
keymap("n", "<leader>co", "<CMD>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>", { noremap = true })

-- pop open rg ready for search
keymap("n", "<leader>f", ":Rg ")

-- Tab navigation
keymap("n", "<leader>tp", ":tabprevious<CR>", { silent = true })
keymap("n", "<leader>tn", ":tabnext<CR>", { silent = true })
keymap("n", "<leader>te", ":tabedit<space>")

-- Close buffers
keymap("n", "<leader>b", ":bd<CR>")

-- LSP
--
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Hover Doc
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "K", require("hover").hover, { desc = "hover.nvim" })
keymap("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

-- Navigate from neovim to multiplexer
keymap("n", "<A-h>", "<CMD>NavigatorLeft<CR>")
keymap("n", "<A-l>", "<CMD>NavigatorRight<CR>")
keymap("n", "<A-k>", "<CMD>NavigatorUp<CR>")
keymap("n", "<A-j>", "<CMD>NavigatorDown<CR>")

-- Switch tab by index using vim.v.count
keymap("n", "<leader>wt", require('wezterm').switch_tab.index)

-- Run :Lazy update
keymap("n", "lu", "<cmd>Lazy update<CR>", { silent = true })
-- Run :Mason update
keymap("n", "mu", "<cmd>Mason<CR>", { silent = true })
