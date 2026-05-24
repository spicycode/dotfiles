require("lazyload").on_vim_enter(
	function()
		vim.pack.add({
			{ src = "https://github.com/nvim-lualine/lualine.nvim" },
		})

		local function folder()
			local cwd = vim.fn.getcwd()
			return cwd:match("([^/]+)$")
		end

		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
		}

		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", diff, "diagnostics" },
				lualine_c = {
					{ folder, color = { gui = "bold" }, separator = "/", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, padding = { left = 0, right = 1 } },
				},
				lualine_x = {
					{
						function()
							return require("dap").status()
						end,
						cond = function()
							return package.loaded["dap"] and require("dap").status() ~= ""
						end,
						icon = "",
					},
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "man", "mason", "quickfix" },
		})

		vim.opt.showmode = false
	end,
	-- TODO: remove sync behavior, hide lualine until after leaving dashboard
	{ sync = true }
)
