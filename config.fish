alias gco "git checkout"
alias git "hub"
alias dev "source dev_env.fish"

function zz -d "Create a directory and set CWD"
  command mkdir $argv
    if test $status = 0
      switch $argv[(count $argv)]
        case '-*'
      case '*'
        cd $argv[(count $argv)]
      return
    end
  end
end

function fish_greeting
  echo "🦑 $USER"
end

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x PYTHONDONTWRITEBYTECODE 1
alias python 'python3'
alias pip 'pip3'

alias vim 'nvim'
alias vi 'nvim'
alias gitclean 'git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d && git remote prune origin'
