require("lazyload").on_vim_enter(function()
	vim.pack.add({
		{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
		{ src = "https://github.com/rafamadriz/friendly-snippets" },
		{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	})

	local default_sources = { "lsp", "path", "snippets", "buffer", "dadbod", "lazydev", "markdown" }
	local providers = {
		snippets = {
			opts = {
				friendly_snippets = true,
				search_paths = { vim.env.HOME .. "/.config/nvim/snippets" },
			},
		},
		dadbod = {
			name = "Dadbod",
			module = "vim_dadbod_completion.blink",
		},
		lazydev = {
			name = "LazyDev",
			module = "lazydev.integrations.blink",
			score_offset = 100,
		},
		markdown = {
			name = "RenderMarkdown",
			module = "render-markdown.integ.blink",
		},
	}

	if Config.use_treesitter_parser then
		table.insert(default_sources, "go_pkgs")
		providers.go_pkgs = {
			name = "Import",
			module = "blink-go-import",
		}
	end

	require("blink.cmp").setup({
		keymap = {
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-space>"] = { "show" },
		},
		cmdline = {
			enabled = true,
			completion = {
				menu = {
					auto_show = true,
					draw = {
						components = {
							-- customize the drawing of kind icons
							kind_icon = {
								text = function(ctx)
									-- default kind icon
									local icon = ctx.kind_icon
									-- if LSP source, check for color derived from documentation
									if ctx.item.source_name == "LSP" then
										local color_item = require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
										if color_item and color_item.abbr ~= "" then
											icon = color_item.abbr
										end
									end
									return icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									-- default highlight group
									local highlight = "BlinkCmpKind" .. ctx.kind
									-- if LSP source, check for color derived from documentation
									if ctx.item.source_name == "LSP" then
										local color_item = require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
										if color_item and color_item.abbr_hl_group then
											highlight = color_item.abbr_hl_group
										end
									end
									return highlight
								end,
							},
						},
					},
				},
				ghost_text = { enabled = true },
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
			},
			keymap = {
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
			},
		},
		completion = {
			trigger = {
				prefetch_on_insert = false,
				show_on_keyword = true,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			documentation = { auto_show = true },
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
		},
		signature = { enabled = true },
		appearance = {
			kind_icons = require("icons").kinds,
		},
		sources = {
			default = default_sources,
			providers = providers,
		},
	})
end)
