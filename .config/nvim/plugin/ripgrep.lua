require("lazyload").on_vim_enter(function()
  vim.pack.add({
    { src = "https://github.com/duane9/nvim-rg" },
  })

  -- vim.keymap.set({ "n", "x" }, "<leader>Rg", function()
  --   require("rip-substitute").sub()
  -- end, { desc = "Search replace (rip-substitute)" })
end)
