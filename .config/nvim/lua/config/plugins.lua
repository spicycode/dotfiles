-- Setup lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},

	spec = {

		{
			"mrjones2014/legendary.nvim",
			-- since legendary.nvim handles all your keymaps/commands,
			-- its recommended to load legendary.nvim before other plugins
			priority = 10000,
			lazy = false,
			-- sqlite is only needed if you want to use frecency sorting
			dependencies = { "kkharji/sqlite.lua" },
		},

		-- Color themes
		{ "catppuccin/nvim", name = "catppuccin" },
		{
			"ferdinandrau/lavish.nvim",
			priority = 1000,
		},

		{ "tpope/vim-vinegar" },
		{ "tpope/vim-fugitive" },
		{ "tpope/vim-rhubarb" },
		{ "tpope/vim-rsi" },
		{ "tpope/vim-git" },
		{ "tpope/vim-sensible" },

		{
			"NeogitOrg/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim", -- required
				"sindrets/diffview.nvim", -- optional - Diff integration
			},
			config = true,
		},
		-- Color and Themes
		--
		-- Highlight CSS Colors
		{
			"brenoprata10/nvim-highlight-colors",
			config = function()
				require("nvim-highlight-colors").setup({})
			end,
		},

		-- Formatting
		{
			"stevearc/conform.nvim",
			opts = {},
		},
		-- LSP
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"lewis6991/hover.nvim",
			config = function()
				require("hover").setup({
					init = function()
						-- Require providers
						require("hover.providers.lsp")
						require("hover.providers.gh")
						require("hover.providers.gh_user")
						-- require('hover.providers.jira')
						require("hover.providers.dap")
						-- require('hover.providers.man')
						-- require('hover.providers.dictionary')
					end,
					preview_opts = {
						border = "single",
					},
					-- Whether the contents of a currently open hover window should be moved
					-- to a :h preview-window when pressing the hover keymap.
					preview_window = false,
					title = true,
					mouse_providers = {
						"LSP",
					},
					mouse_delay = 1000,
				})
				-- Enable mouse move events so we can bind to them for this
				vim.o.mousemoveevent = true
			end,
		},

		-- {
		-- 	"OXY2DEV/markview.nvim",
		-- 	lazy = false, -- Recommended
		-- 	-- ft = "markdown" -- If you decide to lazy-load anyway
		--
		-- 	dependencies = {
		-- 		-- You will not need this if you installed the
		-- 		-- parsers manually
		-- 		-- Or if the parsers are in your $RUNTIMEPATH
		-- 		"nvim-treesitter/nvim-treesitter",
		-- 		"nvim-tree/nvim-web-devicons",
		-- 	},
		-- },

		-- SchemaStore support for jsonls
		{ "b0o/schemastore.nvim" },

		{ "neovim/nvim-lspconfig" },
		{
			"glepnir/lspsaga.nvim",
			event = "BufRead",
			config = function()
				require("lspsaga").setup({
					ui = {
						colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
						kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
					},
				})
			end,
			keys = {
				{ "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Find symbol definition (lsp)" },
				{
					"<leader>ca",
					"<cmd>lua vim.lsp.buf.code_action()<CR>",
					"v",
					desc = "Show code actions (lsp)",
				},
				{ "gr", "<cmd>Lspsaga rename<CR>", desc = "Rename (lsp)" },
				{ "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics (lsp)" },
				{ "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Show outline (lsp)" },
			},
		},
		{
			"j-hui/fidget.nvim",

			config = function()
				require("fidget").setup({})
			end,
		},
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
		{
			"saghen/blink.cmp",
			lazy = false, -- lazy loading handled internally
			version = "*", -- use a release tag to download pre-built binaries
			-- !Important! Make sure you're using the latest release of LuaSnip
			-- `main` does not work at the moment
			dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

			opts = {
				keymap = { preset = "super-tab" },

				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "mono",
				},

				completion = {
					accept = {
						auto_brackets = {
							enabled = true,
							kind_resolution = {
								enabled = true,
								blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
							},
							-- Asynchronously use semantic token to determine if brackets should be added
							semantic_token_resolution = {
								enabled = true,
								blocked_filetypes = { "java" },
								-- How long to wait for semantic tokens to return before assuming no brackets should be added
								timeout_ms = 400,
							},
						},
						-- Create an undo point when accepting a completion item
						create_undo_point = true,
					},

					documentation = {
						auto_show = true,
						auto_show_delay_ms = 250,
						treesitter_highlighting = true,
						window = { border = "rounded" },
					},

					-- Displays a preview of the selected item on the current line
					ghost_text = {
						enabled = false,
					},
				},

				snippets = {
					expand = function(snippet)
						require("luasnip").lsp_expand(snippet)
					end,
					active = function(filter)
						if filter and filter.direction then
							return require("luasnip").jumpable(filter.direction)
						end
						return require("luasnip").in_snippet()
					end,
					jump = function(direction)
						require("luasnip").jump(direction)
					end,
				},

				-- experimental signature help support
				signature = { enabled = true },

				sources = {
					default = { "lsp", "path", "luasnip", "snippets", "buffer", "lazydev" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							fallbacks = { "lsp" },
						},
					},
				},
			},
		},
		{ "ckipp01/stylua-nvim" },
		-- Language Syntax/etc support
		{ "vim-ruby/vim-ruby" },
		{ "tpope/vim-rails" },
		{ "gleam-lang/gleam.vim" },
		{ "dmmulroy/ts-error-translator.nvim" },
		{
			"ray-x/go.nvim",
			dependencies = { -- optional packages
				"ray-x/guihua.lua",
				"neovim/nvim-lspconfig",
				"nvim-treesitter/nvim-treesitter",
			},
			config = function()
				require("go").setup()
			end,
			event = { "CmdlineEnter" },
			ft = { "go", "gomod" },
			build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
		},

		{ "theHamsta/nvim-dap-virtual-text" },
		{ "mfussenegger/nvim-dap" },
		{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		},
		{
			"ibhagwan/fzf-lua",
			opts = {
				oldfiles = {
					include_current_session = true,
					stat_file = true, -- verify files exist on disk
				},
				previewers = {
					-- builtin = false, -- this will disable previewer
					builtin = {
						-- With this change, the previewer will not add syntax highlighting to files larger than 100KB
						syntax_limit_b = 1024 * 100, -- 100KB
					},
				},
				grep = {
					rg_glob = true, -- enable glob parsing
					glob_flag = "--iglob", -- case insensitive globs
				},
				keymap = {
					fzf = {
						-- use cltr-q to select all items and convert to quickfix list
						["ctrl-q"] = "select-all+accept",
					},
				},
			},
			keys = {
				{ "<C-p>", "<cmd>FzfLua files<CR>", desc = "Find files" },
				{ "<C-]>", "<cmd>FzfLua tags<CR>", desc = "Find tags" },
				{ "<leader>lr", "<cmd>FzfLua oldfiles<CR>", desc = "Find recent files" },
				{ "<leader>lb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
				{ "<leader>lt", "<cmd>FzfLua helptags<CR>", desc = "Find help tags" },
				{ "<leader>lg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
			},
		},
		-- Extension for telescope coauthor support
		-- {
		-- 	"cwebster2/github-coauthors.nvim",
		-- 	keys = {
		-- 		{
		-- 			"<leader>co",
		-- 			"<CMD>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>",
		-- 			desc = "Find Co-Author from Git",
		-- 		},
		-- 	},
		-- 	config = function()
		-- 		require("telescope").load_extension("githubcoauthors")
		-- 	end,
		-- },
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- add options here
				-- or leave it empty to use the default settings
			},
			keys = {
				-- suggested keymap
				-- { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
			},
		},
		-- Highlights
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "omnisyle/nvim-hidesig" },
		{ "jparise/vim-graphql" },
		{
			"folke/trouble.nvim",
			keys = {
				{
					"<leader>xx",
					"<cmd>Trouble diagnostics toggle<cr>",
					desc = "Diagnostics (Trouble)",
				},
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				{
					"<leader>cs",
					"<cmd>Trouble symbols toggle focus=false<cr>",
					desc = "Symbols (Trouble)",
				},
				{
					"<leader>cl",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP Definitions / references / ... (Trouble)",
				},
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
			opts = {
				modes = {
					diagnostics = {
						filter = { buf = 0 }, -- filter diagnostics to the current buffer
					},
				},
			},
		},
		{
			"jremmen/vim-ripgrep",
			keys = {
				{ "<leader>f", ":Rg ", desc = "Find with ripgrep" },
			},
		},
		{ "kyazdani42/nvim-web-devicons" },
		{
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"kyazdani42/nvim-web-devicons",
			},
		},
		{ "mcauley-penney/tidy.nvim", event = "BufWritePre" },
		{
			"pwntester/octo.nvim",
			config = function()
				require("octo").setup()
				-- Enable markdown in octo.nvim
				vim.treesitter.language.register("markdown", "octo")
			end,
			cmd = "Octo",
		},
		-- Tab Bar
		{ "nanozuki/tabby.nvim" },
		{ "nicwest/vim-camelsnek" },
		{
			"letieu/wezterm-move.nvim",
			keys = { -- Lazy loading, don't need call setup() function
				{
					"<C-h>",
					function()
						require("wezterm-move").move("h")
					end,
					desc = "Move left (wezterm)",
				},
				{
					"<C-j>",
					function()
						require("wezterm-move").move("j")
					end,
					desc = "Move down (wezterm)",
				},
				{
					"<C-k>",
					function()
						require("wezterm-move").move("k")
					end,
					desc = "Move up (wezterm)",
				},
				{
					"<C-l>",
					function()
						require("wezterm-move").move("l")
					end,
					desc = "Move right (wezterm)",
				},
			},
		},
		{ "amilsil/codewho" },
		{
			"yetone/avante.nvim",
			event = "VeryLazy",
			build = "make",
			opts = {
				provider = "claude",
				hints = {
					enabled = true,
				},
				-- add any opts here
			},
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				"stevearc/dressing.nvim",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				--- The below is optional, make sure to setup it properly if you have lazy=true
				{
					"MeanderingProgrammer/render-markdown.nvim",
					opts = {
						file_types = { "Avante" },
					},
					ft = { "Avante" },
				},
			},
		},
		{
			"nvchad/volt",
			lazy = true,
		},
		{
			"nvchad/menu",
			lazy = true,
		},
		{
			"MagicDuck/grug-far.nvim",
			opts = { headerMaxWidth = 80 },
			keys = {
				{
					"\\",
					function()
						local grug = require("grug-far")
						local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
						grug.open({
							transient = true,
							prefills = {
								filesFilter = ext and ext ~= "" and "*." .. ext or nil,
							},
						})
					end,
					mode = { "n", "v" },
					desc = "Search and Replace",
				},
			},
			config = function()
				require("grug-far").setup()
			end,
		},
	},
})
