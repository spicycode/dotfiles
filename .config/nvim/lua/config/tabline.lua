local theme = {
  -- fill = 'TabLineFill',
  fill = { fg='#f2e9de', bg='#fff', style='italic' },
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

require('tabby.tabline').set(function(line)
  return {
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      local lhs = tab.is_current() and ' ' or ' '
      local rhs = tab.is_current() and '' or ''

      return {
        line.sep(lhs, hl, theme.fill),
        tab.is_current() and '➤' or '',
        tab.name(),
        line.sep(rhs, hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    hl = theme.fill,
  }
end)
