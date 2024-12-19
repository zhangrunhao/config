export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:$PATH"

export TERM=xterm-256color

function rename_wezterm_title {
  echo "\x1b]1337;SetUserVar=panetitle=$(echo -n $1 | base64)\x07"
}
