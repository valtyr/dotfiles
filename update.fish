function update-dotfiles -d "Pull dotfiles from github"
  set currentdir $PWD
  cd ~/.dotfiles
  git pull
  cd $currentdir
end
