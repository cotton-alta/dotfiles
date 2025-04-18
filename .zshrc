# rbenv init
eval "$(rbenv init -)"

# goenv init
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

# nvm init
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# direnv init
eval "$(direnv hook zsh)"

# load zgen
source "$HOME/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen load paulirish/git-open

  # generate the init script from plugins above
  zgen save
fi

function git-branch {
  local branch_name st branch_status

  # Check if current directory is a git repository by looking for .git directory
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status=""
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    branch_status=" [!]"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    branch_status=" [*]"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    branch_status=" [+]"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    echo "%F{red} [!!]"
    return
  else
    branch_status=""
  fi
  echo "%F{212}$branch_name%f${branch_status}"
}

setopt prompt_subst

# prompt setting
PROMPT=$'%F{81}%n%f \U26FA %F{121}%(5~,%-2~/.../%2~,%~)%f `git-branch` %# '

