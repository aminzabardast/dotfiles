# Install NVM

source "$PWD/utils.sh"

cecho "RED" "Installing NVM ..."
curl https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
cecho "RED" "Installing Node.js ..."
nvm install --lts
cecho "RED" "Updating NPM ..."
npm install -g npm
