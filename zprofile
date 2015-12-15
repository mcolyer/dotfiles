export EDITOR="vim"

# Node
export PATH="./node_modules/.bin:$PATH"

# Boxen
if [ -f /opt/boxen/env.sh ]; then
  source /opt/boxen/env.sh
fi

# AWS
source /opt/boxen/homebrew/share/zsh/site-functions/_aws
