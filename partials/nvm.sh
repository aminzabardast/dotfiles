# Install NVM

source "$PWD/utils.sh"

cecho "RED" "Installing NVM ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | sh
echo "
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
" >> .profile
source "$HOME/.profile"
cecho "RED" "Installing Node.js ..."
nvm install --lts
cecho "RED" "Updating NPM ..."
npm install -g npm
