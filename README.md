## Installation

First, clone the repository into your home folder.

	cd ~/ && git clone git@github.com:mohislm/dotfiles.git .dotfiles

Add the following to your .bashrc file.

	for file in $HOME/.dotfiles/*.sh; do
	  [[ -r $file ]] && source $file;
	done
