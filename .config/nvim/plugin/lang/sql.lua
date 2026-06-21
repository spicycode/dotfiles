require("lazyload").on_vim_enter(function()
  vim.pack.add({
    { src = "https://github.com/jsborjesson/vim-uppercase-sql" },
    { src = "https://github.com/tpope/vim-dadbod" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
  })

  vim.g.db_ui_save_location = "~/src/dbui"
  vim.g.db_ui_tmp_query_location = "~/src/dbui/queries"
  vim.g.db_ui_use_nerd_fonts = true
  vim.g.db_ui_execute_on_save = false
  vim.g.db_ui_use_nvim_notify = true
end)
