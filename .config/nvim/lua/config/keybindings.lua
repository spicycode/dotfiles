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
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Diagnostic jump can use `<c-o>` to jump back
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })

-- Callhierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
