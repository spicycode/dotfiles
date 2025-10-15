local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	desc = "Autoformat go files pre save",
	callback = function()
		-- runs go fmt and go import
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

local quickfix_grp = vim.api.nvim_create_augroup("quickfix", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	desc = "Set nowrap on Quickfix",
	callback = function()
		vim.wo.wrap = false
	end,
	group = quickfix_grp,
})

-- augroup quickfix
--     autocmd!
--     autocmd FileType qf setlocal wrap
-- augroup END
