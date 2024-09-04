require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"graphql",
		"markdown",
		"markdown_inline",
		"jsdoc",
		"python",
		"sql",
		"json",
		"typescript",
		"bash",
		"tsx",
		"dockerfile",
		"ruby",
		"gitcommit",
		"javascript",
		"diff",
		"yaml",
		"rust",
		"html",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- Attempting to fix  constant reinstalls https://www.reddit.com/r/neovim/comments/110x08m/treesitter_keeps_recompiling_parsers/
	version = nil,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},

	hidesig = {
		enable = true,
		opacity = 0.55, -- opacity for sig definitions
		delay = 200, -- update delay on CursorMoved and InsertLeave
	},
})
