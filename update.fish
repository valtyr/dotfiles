function update
  set currentdir $PWD
  cd ~/.dotfiles
  git pull
  cd $currentdir
end