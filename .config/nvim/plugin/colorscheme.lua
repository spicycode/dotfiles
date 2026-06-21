vim.pack.add({
  { src = "https://github.com/afonsofrancof/OSC11.nvim" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin", version = vim.version.range("*") },
}, { load = false })

vim.g.bones_compat = 1 -- use built-in vim highlight API, not lush.nvim

-- Set colorscheme.
do
  local function set_dark()
    vim.o.background = "dark"
    vim.cmd.colorscheme("catppuccin-mocha")
  end

  local function set_light()
    vim.o.background = "light"
    vim.cmd.colorscheme("catppuccin-latte")
  end

  if vim.o.background == "light" then
    set_light()
  else
    set_dark()
  end

  require("osc11").setup({
    on_dark = set_dark,
    on_light = set_light,
  })
end
