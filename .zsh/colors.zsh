autoload -U colors && colors

# Clear LSCOLORS
unset LSCOLORS
export CLICOLOR=1
# LSCOLORS - Default except for normal directories (first character) to replace hard-to-read blue
# For details, see manpage for ls
export LS_COLORS=Gxfxcxdxbxegedabagacad
