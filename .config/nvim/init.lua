-- Experimental Lua module loader.
vim.loader.enable()

-- States for this Neovim config.
_G.Config = {
	called = {},

	-- treesitter
	use_treesitter_parser = true,
	use_nvim_treesitter = true,
	use_arborist = false, -- experiment
}
function _G.Config.add(spec)
	require("merge")(_G.Config, spec)
end

vim.g.mapleader = "," -- use comma for <Leader>
vim.g.maplocalleader = " "

require("options")
require("keymaps")

-- Experimental: ui2 message/cmdline redesign (:h ui2)
-- Avoids "Press ENTER" prompts, highlights cmdline, pager as buffer.
require("vim._core.ui2").enable()
