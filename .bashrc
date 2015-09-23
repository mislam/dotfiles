# Tell terminal to be colorful
export CLICOLOR=1

# Style bash prompt
function __update_ps1() {
  export PS1="$(~/.dotfiles/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="__update_ps1; $PROMPT_COMMAND"

# Use latest version of Git instead of Apple Git
export PATH="/usr/local/bin:$PATH"

# Load NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# Use dotfiles
for file in $HOME/.dotfiles/*.sh; do
  [[ -s $file ]] && . $file;
done

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
if [[ -d "$HOME/.rvm/bin" ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# Important: Do not add anything below this line
