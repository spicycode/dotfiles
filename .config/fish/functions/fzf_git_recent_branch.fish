function fzf_git_recent_branch -d "Efficient fish keybinding for fzf with git branch"
  eval "git branch --sort=-authordate | fzf --query (commandline)" | read -z select

  if test -n $select
    set -l branch (builtin string trim --left --chars='* ' "$select")
    eval "git checkout $branch"
  end

  commandline -f repaint
end
