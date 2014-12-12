# Tell terminal to be colorful
export CLICOLOR=1

# Style bash prompt
function __update_ps1() {
  export PS1="$(~/.dotfiles/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="__update_ps1; $PROMPT_COMMAND"

# Use latest version of Git instead of Apple Git
export PATH="/usr/local/bin:$PATH"

# Add android SDK tools to the PATH
if [[ -d "$HOME/Development/android-sdk" ]]; then
  export PATH="$PATH:$HOME/Development/android-sdk/platform-tools"
  export PATH="$PATH:$HOME/Development/android-sdk/tools"
fi

# Load NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# Use dotfiles
for file in $HOME/.dotfiles/*.sh; do
  [[ -s $file ]] && . $file;
done

# Important: Do not add anything below this line

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
