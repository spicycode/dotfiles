function update_software
  echo "==> Upgrading gh extensions"
  gh extension upgrade --all
  echo ""

  echo "==> Upgrading asdf plugins"
  asdf plugin-update --all
  echo ""

  echo "==> Upgrading homebrew"
  brew update && brew outdated && brew upgrade 
  echo ""
end
