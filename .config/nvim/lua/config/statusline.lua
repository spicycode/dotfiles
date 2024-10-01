local config = {
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				function()
					return ""
				end,
				padding = { left = 1, right = 0 },
				separator = "",
			},
			"mode",
		},
		lualine_b = {
			"filename",
			"branch",
		},
		lualine_c = {
			"diagnostics",
		},

		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
}

require("lualine").setup(config)
