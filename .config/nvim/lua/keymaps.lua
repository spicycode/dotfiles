-- General keymaps not tied to any specific plugin.
-- Sourced from init.lua before any plugin/ files.

-- Vim Vinegar emulation
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width", silent = true })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })

-- Move lines (alt+j/k)
local is_mac = vim.fn.has("macunix") == 1
local down_keys = is_mac and { "∆", "<M-j>", "<A-j>" } or { "<M-j>" }
local up_keys = is_mac and { "˚", "<M-k>", "<A-k>" } or { "<M-k>" }
local function map_multiple(mode, keys, command, opts)
  for _, key in ipairs(keys) do
    vim.keymap.set(mode, key, command, opts)
  end
end
map_multiple("n", down_keys, ":m .+1<CR>==", { desc = "Move line down", silent = true })
map_multiple("n", up_keys, ":m .-2<CR>==", { desc = "Move line up", silent = true })
map_multiple("i", down_keys, "<Esc>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
map_multiple("i", up_keys, "<Esc>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
map_multiple("v", down_keys, ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map_multiple("v", up_keys, ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Buffers
vim.keymap.set("n", "<leader>`", "<C-^>", { desc = "Alternate buffers" })
vim.keymap.set("n", "<leader>bN", "<cmd>enew<cr>", { desc = "New buffer" })
for _, key in ipairs({ "<S-l>", "<leader>bn", "]b" }) do
  vim.keymap.set("n", key, "<cmd>bnext<cr>", { desc = "Next buffer" })
end
for _, key in ipairs({ "<S-h>", "<leader>bp", "[b" }) do
  vim.keymap.set("n", key, "<cmd>bprevious<cr>", { desc = "Prev buffer" })
end
vim.keymap.set("n", "<leader>bd", "<cmd>bd %<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", function()
  local visible = {}
  for _, win in pairs(vim.api.nvim_list_wins()) do
    visible[vim.api.nvim_win_get_buf(win)] = true
  end
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    if not visible[buf] then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end, { desc = "Close all other buffers" })
vim.keymap.set("n", "<leader>by", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.fn.setreg("+", path)
  vim.notify("Copied to clipboard: " .. path, vim.log.levels.INFO)
end, { desc = "Yank buffer filepath (relative)" })
vim.keymap.set("n", "<leader>bY", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied to clipboard: " .. path, vim.log.levels.INFO)
end, { desc = "Yank buffer filepath (absolute)" })

-- Tabs

vim.keymap.set("n", "<leader>te", ":tabedit<space>", { desc = "Edit in Tab", silent = true })
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "Close Tab", silent = true })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab", silent = true })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab", silent = true })

vim.keymap.set("n", "<leader>f", ":Rg ", { desc = "Find with Ripgrep" })
-- Clear search with <esc>
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Lists
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "[q", function()
  pcall(vim.cmd.cprev)
end, { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", function()
  pcall(vim.cmd.cnext)
end, { desc = "Next quickfix" })
vim.keymap.set("n", "[l", function()
  pcall(vim.cmd.lprev)
end, { desc = "Previous location" })
vim.keymap.set("n", "]l", function()
  pcall(vim.cmd.lnext)
end, { desc = "Next location" })

-- Diagnostics
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]e", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error", silent = true })
vim.keymap.set("n", "[e", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error", silent = true })
vim.keymap.set("n", "]w", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
end, { desc = "Next Warning", silent = true })
vim.keymap.set("n", "[w", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
end, { desc = "Prev Warning", silent = true })

-- Folding
vim.keymap.set("v", "zf", function()
  vim.wo.foldmethod = "manual"
  vim.notify("Foldmethod set to manual", vim.log.levels.INFO)
  return "zf"
end, { desc = "Create manual fold", expr = true, silent = true })
vim.keymap.set("n", "<leader>uF", function()
  vim.wo.foldmethod = "expr"
  vim.notify("Foldmethod set to expr", vim.log.levels.INFO)
end, { desc = "Reset to expr folding", silent = true })
