vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim", version = vim.version.range("*") },
})

Snacks.setup({
  styles = {
    notification = {
      border = "rounded",
      wo = { winblend = 0, wrap = false },
    },
    notification_history = {
      relative = "editor",
      width = 0.9,
      height = 0.9,
    },
  },

  dashboard = {
    enabled = false,
  },

  notifier = { enabled = true, timeout = 2000 },

  picker = {
    enabled = true,
    sources = {
      files = {
        hidden = true,
        ignored = false,
      },
    },
  },

  explorer = { enabled = true },

  lazygit = {
    enabled = true,
    configure = true,
    config = {
      os = { editPreset = "nvim-remote" },
      gui = { nerdFontsVersion = "3" },
      git = { overrideGpg = true },
    },
  },

  terminal = { enabled = true },

  quickfile = { enabled = true },

  zen = {
    enabled = false,
  },

  image = { enabled = true },
})

local function default_branch()
  return require("git").get_default_branch()
end

local exclude = {
  "*.pb.go",
  "**/.venv",
  ".mypy_cache/*",
  ".repro/*",
  "**/node_modules",
  ".sage/tools",
  ".pocket/tools",
}

local snacks_file_picker = function()
  Snacks.picker.smart({
    layout = { hidden = { "preview" } },
    multi = { "buffers", "files" },
    hidden = true,
    ignored = false,
    exclude = exclude,
    formatters = { file = { truncate = 100 } },
  })
end

-- Misc

vim.keymap.set("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

-- Explorer
vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer.open({ hidden = true, ignored = true, exclude = { ".DS_Store" } })
end, { desc = "Explorer" })
vim.keymap.set("n", "<leader>E", function()
  Snacks.explorer.reveal({ hidden = true, ignored = true })
end, { desc = "Explorer (reveal buffer)" })

-- LSP (via picker)
vim.keymap.set("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
vim.keymap.set("n", "gs", function()
  vim.cmd("split")
  vim.lsp.buf.definition()
end, { desc = "Goto Definition (split)" })
vim.keymap.set("n", "gv", function()
  vim.cmd("vsplit")
  vim.lsp.buf.definition()
end, { desc = "Goto Definition (vertical split)" })
vim.keymap.set("n", "gD", function()
  Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function()
  Snacks.picker.lsp_references()
end, { desc = "References" })
vim.keymap.set("n", "gI", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gt", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function()
  if vim.bo.filetype == "go" then
    local current_file = vim.fn.expand("%:t")
    local is_test_file = current_file:match("_test%.go$") ~= nil
    if is_test_file then
      require("pickers").go_package_symbols({ file_types = { "TestGoFiles", "XTestGoFiles" } })
    else
      require("pickers").go_package_symbols({ file_types = { "GoFiles", "CgoFiles" } })
    end
  else
    Snacks.picker.lsp_symbols()
  end
end, { desc = "LSP Symbols" })

vim.keymap.set("n", "<leader>sS", function()
  Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Symbols (workspace)" })

-- Search
vim.keymap.set("n", "<leader>lf", snacks_file_picker, { desc = "Files" })
vim.keymap.set("n", "<C-p>", snacks_file_picker, { desc = "Files" })

vim.keymap.set("n", "<leader>lg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>lr", function()
  Snacks.picker.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>lh", function()
  Snacks.picker.help()
end, { desc = "Help pages" })

vim.keymap.set("n", "<leader>la", function()
  Snacks.picker.autocmds()
end, { desc = "Autocommands" })

vim.keymap.set("n", "<leader>lb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>lc", function()
  Snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>sH", function()
  Snacks.picker.highlights()
end, { desc = "Highlight groups" })

vim.keymap.set("n", "<leader>lk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>lM", function()
  Snacks.picker.man()
end, { desc = "Man pages" })

vim.keymap.set("n", "<leader>lm", function()
  Snacks.picker.marks()
end, { desc = "Marks" })

vim.keymap.set("n", "<leader>ln", function()
  Snacks.picker.notifications()
end, { desc = "Notifications" })

vim.keymap.set("n", "<leader>lj", function()
  Snacks.picker.jumps()
end, { desc = "Jumplist" })

vim.keymap.set("n", "<leader>lq", function()
  Snacks.picker.qflist()
end, { desc = "Quickfix List" })

vim.keymap.set("n", "<leader>lF", function()
  Snacks.picker.recent()
end, { desc = "Recent files" })

vim.keymap.set("n", "<leader>ld", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Document diagnostics" })

vim.keymap.set("n", "<leader>lD", function()
  Snacks.picker.diagnostics()
end, { desc = "Workspace diagnostics" })

vim.keymap.set("n", "<leader>lt", function()
  Snacks.picker.todo_comments()
end, { desc = "Todo" })

vim.keymap.set("n", "<leader>lT", function()
  Snacks.picker.todo_comments({ keywords = { "TODO", "FIX" } })
end, { desc = "Todo/Fix/Fixme" })

vim.keymap.set("n", "<leader>lP", function()
  require("pickers").pull_requests()
end, { desc = "Pull Requests" })

vim.keymap.set("n", "<leader>ll", function()
  require("pickers").neovim_logs()
end, { desc = "Neovim logs" })

-- Git
vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit.open()
end, { desc = "LazyGit" })

vim.keymap.set("n", "<leader>sgc", function()
  Snacks.picker.git_log()
end, { desc = "Git commit log" })

vim.keymap.set("n", "<leader>sgd", function()
  Snacks.picker.git_diff({ base = default_branch(), group = true })
end, { desc = "Git Diff (default branch)" })

vim.keymap.set("n", "<leader>gdp", function()
  Snacks.picker.git_diff({ base = default_branch(), group = true })
end, { desc = "Git Diff Picker (default branch)" })

vim.keymap.set("n", "<leader>sgD", function()
  Snacks.picker.git_diff({ group = true })
end, { desc = "Git Diff (HEAD)" })

vim.keymap.set("n", "<leader>gdP", function()
  Snacks.picker.git_diff({ group = true })
end, { desc = "Git Diff Picker (HEAD)" })

vim.keymap.set("n", "<leader>sgf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git commit log (file)" })

vim.keymap.set("n", "<leader>sgl", function()
  Snacks.picker.git_log_line()
end, { desc = "Git commit log (line)" })

vim.keymap.set("n", "<leader>sgs", function()
  Snacks.picker.git_status()
end, { desc = "Git status" })

vim.keymap.set("n", "<leader>sgS", function()
  Snacks.picker.git_stash()
end, { desc = "Git stash" })

vim.keymap.set("n", "<leader>sgb", function()
  Snacks.picker.git_branches()
end, { desc = "Git branches" })

-- UI
vim.keymap.set("n", "<leader>un", function()
  Snacks.notifier.show_history()
end, { desc = "Notification history" })

-- Terminal
-- Both <C-/> and <C-_> are mapped due to how terminal emulators interpret control characters.
local function floating_term()
  Snacks.terminal.toggle({ "zsh" }, { cwd = vim.fn.getcwd() })
end
vim.keymap.set({ "n", "i", "t", "v" }, "<C-/>", floating_term, { desc = "Toggle floating terminal" })
vim.keymap.set({ "n", "i", "t", "v" }, "<C-_>", floating_term, { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>T", function()
  Snacks.terminal()
end, { desc = "Terminal" })
