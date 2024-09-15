local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "flex",
		layout_config = {
			horizontal = { preview_cutoff = 80, preview_width = 0.55 },
			vertical = { mirror = true, preview_cutoff = 25 },
			prompt_position = "top",
			width = 0.87,
			height = 0.80,
		},
		sorting_strategy = "ascending",
		preview = false,
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			layout_config = {
				height = 0.70,
			},
		},
		file_browser = {
			disable_devicons = false,
			previewer = false,
		},
	},
	buffers = {
		show_all_buffers = true,
	},
	live_grep = {
		previewer = false,
		layout_config = {
			height = 0.70,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})
