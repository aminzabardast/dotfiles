# Install NVM

source "$PWD/utils.sh"

cecho "RED" "Installing NVM ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | sh
cecho "RED" "Installing Node.js ..."
nvm install --lts
cecho "RED" "Updating NPM ..."
npm install -g npm