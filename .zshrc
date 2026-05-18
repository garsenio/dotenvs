alias python=/usr/bin/python3
export PATH="/opt/homebrew/bin:$PATH"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

function x() {
  local folder="${1:?Usage: x <foldername>}"
  local dir="$HOME/projs/$folder"
  if [[ ! -d "$dir" ]]; then
    echo "budget-ide: '$dir' does not exist"
    return 1
  fi

  local left=$(wezterm cli spawn --cwd "$dir")
  local right_top=$(wezterm cli split-pane --pane-id "$left" --right --cwd "$dir")
  local right_bottom=$(wezterm cli split-pane --pane-id "$right_top" --bottom --cwd "$dir")

  wezterm cli send-text --pane-id "$right_bottom" $'claude\n'
  wezterm cli send-text --pane-id "$left" $'hx .\n'
  wezterm cli activate-pane --pane-id "$left"
}
