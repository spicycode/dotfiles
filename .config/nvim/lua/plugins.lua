local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("christoomey/vim-tmux-navigator")
	use("tmux-plugins/vim-tmux-focus-events")

	use("tpope/vim-vinegar")

	-- Async building & commands
	use("tpope/vim-dispatch")
	use("tpope/vim-fugitive")
	use("tpope/vim-rsi")
	use("tpope/vim-git")
	use("tpope/vim-sensible")
	use("tpope/vim-commentary")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("j-hui/fidget.nvim")

	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-emoji')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-path')
  

	use("ckipp01/stylua-nvim")
	use("nvim-lua/completion-nvim")
	use("nvim-lua/lsp_extensions.nvim")
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use("folke/trouble.nvim")

	-- Color and Themes
	-- Highlight CSS Colors
	use("norcalli/nvim-colorizer.lua")
	use("ayu-theme/ayu-vim")

	-- Make Quickfix nice
	use("https://gitlab.com/yorickpeterse/nvim-pqf.git")

	-- Language Syntax/etc support
	use("euclidianAce/BetterLua.vim")
	use("vim-ruby/vim-ruby")
	use("tpope/vim-rails")

	-- elixir
	use("vim-erlang/vim-erlang-runtime")
	use("vim-erlang/vim-erlang-compiler")
	use("vim-erlang/vim-erlang-omnicomplete")
	use("elixir-lang/vim-elixir")
	use("slashmili/alchemist.vim")
	use("avdgaag/vim-phoenix")

	-- rust
	use("rust-lang/rust.vim")

  -- Search
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})


	-- Registers
	use("junegunn/vim-peekaboo")

	-- Quickfix
	-- use {'Olical/vim-enmasse', cmd = 'EnMasse'}
	use("kevinhwang91/nvim-bqf")

	-- Terminal
	use("voldikss/vim-floaterm")

	-- Highlights
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		run = ":TSUpdate",
	})

	-- Just for tracking progess until this is ready for use
	-- use 'mfussenegger/nvim-lint'

	use("hrsh7th/nvim-compe")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")

	-- Debugger
	use({ "mfussenegger/nvim-dap", opt = true })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "Pocco81/DAPInstall.nvim" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	use({
		"puremourning/vimspector",
		setup = [[vim.g.vimspector_enable_mappings = 'HUMAN']],
		disable = true,
	})

	use("jparise/vim-graphql")

	use("fladson/vim-kitty")
	use("knubie/vim-kitty-navigator")

	use("kyazdani42/nvim-web-devicons")

  use("jremmen/vim-ripgrep")

	use("wincent/pinnacle")
end)
