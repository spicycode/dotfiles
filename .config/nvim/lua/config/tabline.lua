--- https://github.com/nanozuki/tabby.nvim/blob/main/lua/tabby/presets.lua

local tabby = require("tabby")
local util = require('tabby.util')

local hl_tabline_fill = util.extract_nvim_hl('lualine_c_normal')
local hl_tabline = util.extract_nvim_hl('lualine_b_normal')
local hl_tabline_sel = util.extract_nvim_hl('lualine_a_normal')

local function tab_label(tabid, active)
  local icon = active and '➤' or ' '
  local name = util.get_tab_name(tabid)
  return string.format('%s %s', icon, name)
end

local presets = {
  hl = 'lualine_c_normal',
  layout = 'tab_only',
  head = {
    { '', hl = {} },
    { '', hl = {} },
  },
  active_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, true),
        hl = { fg = hl_tabline.fg, style = 'bold' },
      }
    end,
    left_sep = { ' ', hl = { fg = hl_tabline.fg } },
    right_sep = { ' ', hl = { fg = hl_tabline.fg } },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, false),
        hl = { fg = hl_tabline_sel.bg },
      }
    end,
    left_sep = { ' ', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    right_sep = { ' ', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
  },
}

tabby.setup({
  tabline = presets
})
