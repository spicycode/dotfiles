require("conform").setup({
	default_format_opts = {
		timeout_ms = 3000,
		lsp_format = "fallback", -- not recommended to change
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
	formatters_by_ft = {
		go = { "goimports", "gofmt" },

		rust = { "rustfmt", lsp_format = "fallback" },

		lua = { "stylua" },

		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },

		cpp = { "clang-format" },

		sh = { "shfmt", "beautysh" },

		zsh = { "shfmt" },

		-- yaml = { "yamlfmt" },

		terraform = { "terraform_fmt" },

		-- Use the "*" filetype to run formatters on all filetypes.
		["*"] = { "codespell" },
		-- Use the "_" filetype to run formatters on filetypes that don't
		-- have other formatters configured.
		["_"] = { "trim_whitespace" },
	},
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
