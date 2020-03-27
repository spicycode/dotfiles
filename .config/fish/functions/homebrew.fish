function homebrew
  echo "==> Running 'brew update'" && brew update &&
  echo "==> Running 'brew outdated'" && brew outdated &&
  echo "==> Running 'brew upgrade'" && brew upgrade &&
  echo "==> Running 'brew cleanup'" && brew cleanup
end
