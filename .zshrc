# prompt setting
PROMPT=$'%F{81}%n%f \U26FA %F{121}%(5~,%-2~/.../%2~,%~)%f %# '

# rbenv init
eval "$(rbenv init -)"

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

