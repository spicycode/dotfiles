require("conform").setup({
	default_format_opts = {
		timeout_ms = 3000,
		async = false, -- not recommended to change
		quiet = false, -- not recommended to change
		lsp_format = "fallback", -- not recommended to change
	},
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt" },

		lua = { "stylua" },

		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },

		cpp = { "clang-format" },

		sh = { "shfmt" },

		zsh = { "shfmt" },
	},
})

vim.cmd([[ command! Format execute 'lua require("conform").format()' ]])
