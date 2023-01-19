-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- Inserts a component in lualine_x ot right section
local config = {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diagnostics' },
    lualine_x = {},
    lualine_y = { 'filetype' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
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
