# Get the absolute path where the script resides
BASEDIR="$( cd "$( dirname "$( dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

# This is a general-purpose function to ask Yes/No questions in Bash, either
# with or without a default answer. It keeps repeating the question until it
# gets a valid answer.
ask() {
  while true; do

    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi

    # Ask the question
    read -p "$1 [$prompt] " REPLY

    # Default?
    if [ -z "$REPLY" ]; then
      REPLY=$default
    fi

    # Check if the reply is valid
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac

  done
}

# Read and store git user name and email
read_git_config() {
  GIT_USER_NAME="$( git config --global user.name )"
  GIT_USER_EMAIL="$( git config --global user.email )"
}

# Write git user name and email from previously stored values
write_git_config() {
  git config --global user.name "$GIT_USER_NAME"
  git config --global user.email "$GIT_USER_EMAIL"
}

# Copy a file from source to destination with a safe backup
# Syntax: safe_copy <src> <dst>
safe_copy() {
  # if file exists create backup first
  if [ -f "$2" ]; then
    cp $2 $2.bak
  fi
  cp $1 $2
}

setup_vim() {
  vimdir=$HOME/.vim

  if [ -d "$vimdir" ]; then
    echo ""
    if ! ask "This will remove the .vim directory. Continue?" Y; then
      exit
    fi
  fi

  # Recreate .vim directory
  rm -rf $vimdir && mkdir $vimdir

  # Create backups, swaps and undo directories
  mkdir $vimdir/backups $vimdir/swaps $vimdir/undo

  echo -e "\n$(tput setaf 7)Installing Vundle...$(tput sgr 0)"
  git clone https://github.com/gmarik/Vundle.vim $vimdir/bundle/vundle.vim

  # Install plugins
  echo -e "\n$(tput setaf 7)Installing vim plugins...$(tput sgr 0)"
  vim +PluginInstall +qall &> /dev/null
}

# Copy all dotfiles to $HOME
copy_dotfiles() {
  echo -e "\n$(tput setaf 7)Copying all dotfiles...$(tput sgr 0)"
  declare -a arr=(
    ".bash_profile"
    ".bashrc"
    ".vimrc"
    ".gitconfig"
    ".gitignore_global"
  )
  for i in "${arr[@]}"; do
    safe_copy $BASEDIR/$i $HOME/$i
  done
}

main() {
  read_git_config
  copy_dotfiles
  write_git_config
  setup_vim
}

main
echo -e "\n$(tput setaf 2)Done$(tput sgr 0)\n"
