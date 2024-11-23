function update-software
  echo "==> Upgrading gh extensions"
  gh extension upgrade --all
  echo ""

  if type -q asdf
    echo "==> Upgrading asdf plugins"
    asdf plugin-update --all
    source (brew --prefix asdf)"/libexec/asdf.fish"
    echo ""
  end

  echo "==> Upgrading homebrew"
  brew update && brew outdated && brew upgrade
  echo ""

  echo "===> Truncating lsp.log since it cannot auto-rotate"
  truncate -s 0 ~/.local/state/nvim/lsp.log
  echo ""

  echo "===> Auto-generating completions for fish"
  fish_update_completions
  echo ""
end
