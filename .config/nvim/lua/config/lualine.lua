-- Inserts a component in lualine_x ot right section
local config = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = {},
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}

}

-- Inserts a component in lualine_c to right section
local function ins_right(component)
  table.insert(config.sections.lualine_c, component)
end

ins_right {
  'lsp_progress',
  display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
  timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
  spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
}

require('lualine').setup(config)
