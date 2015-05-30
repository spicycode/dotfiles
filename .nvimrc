" Source:
source ~/.nvim/global.vim
source ~/.nvim/plugins.vim
source ~/.nvim/statusbar.vim
source ~/.nvim/keybindings.vim
source ~/.nvim/plugin_config.vim
source ~/.nvim/auto_commands.vim

if has("gui_running")
  source ~/.nvim/gui_config.vim
else
  source ~/.nvim/console_config.vim
endif
