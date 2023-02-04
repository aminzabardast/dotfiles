# Colors
wal -R -q -e

# Oh-my-zsh Stuff
export ZSH="/home/amin/.oh-my-zsh"
ZSH_THEME="dstufft"
DISABLE_MAGIC_FUNCTIONS="true"
plugins=(
  git
  docker
  fzf
  pass
)
export EDITOR=vim
source $ZSH/oh-my-zsh.sh

# NVM stuff
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NODE_OPTIONS=--max_old_space_size=4096

# Pyenv Stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Aliases
source $HOME/.personal

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
