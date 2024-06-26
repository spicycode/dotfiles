local config = {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
  },
  sections = {
    lualine_a = {
      { 'mode' },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diagnostics' },
    lualine_x = {},
    lualine_y = { 'filetype' },
    lualine_z = {
      { 'location' },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {}
}

require('lualine').setup(config)
