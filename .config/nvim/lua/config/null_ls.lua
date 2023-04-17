require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    'vale',
    'stylua',
    'jq',
    'actionlint',
    'eslint_d'
    -- Opt to list sources here, when available in mason.
  },
  automatic_installation = true,
  handlers = {},
})
