require("catppuccin").setup({
  cmp = true,
  fidget = true,
  markdown = true,
  mason = true,
  native_lsp = {
    enabled = true,
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
    },
    underlines = {
      errors = { "underline" },
      hints = { "underline" },
      warnings = { "underline" },
      information = { "underline" },
    },
  },
  lsp_saga = true,
  lsp_trouble = true,
  treesitter = true
})

vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd.syntax = "on"
