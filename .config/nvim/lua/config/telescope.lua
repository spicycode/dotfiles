require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    preview = false
  },
  pickers = {
    find_files = { 
      find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
      layout_config = {
        height = 0.70
      }
    },
    file_browser = { 
      disable_devicons = false, 
      previewer = false 
    }
  },
  buffers = {
    show_all_buffers = true
  },
  live_grep = {
    previewer = false,
    theme = "dropdown"
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

-- Load github coauthors extension
require('telescope').load_extension('githubcoauthors')
