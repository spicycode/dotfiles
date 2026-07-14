require("lazyload").on_vim_enter(function()
  vim.pack.add({
    { src = "https://github.com/stevearc/quicker.nvim", version = vim.version.range("*") },
  })
  require("quicker").setup()
end)
