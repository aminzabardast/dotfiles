# Install NVM

source "$PWD/utils.sh"

cecho "RED" "Installing NVM ..."
curl https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | sh
source "$HOME/.profile"
cecho "RED" "Installing Node.js ..."
nvm install --lts
cecho "RED" "Updating NPM ..."
npm install -g npm
