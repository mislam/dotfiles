# Dotfiles

Configure your (Mac or Linux) terminal with beautiful, yet useful prompt. It also comes pre-configured with all necessary VIM plugins.

<img src="https://cloud.githubusercontent.com/assets/508043/17113483/f456e47c-5278-11e6-9b08-21fc2bc34202.png" height="258">

## Examples

Clean working directory:

<img src="https://cloud.githubusercontent.com/assets/508043/17109616/babf0594-5266-11e6-8a1d-46dab4ef04c3.png" height="36">

Unclean working directory:

<img src="https://cloud.githubusercontent.com/assets/508043/17109625/c7288026-5266-11e6-80a9-a3c9bbcc7d4f.png" height="36">

After staging few files:

<img src="https://cloud.githubusercontent.com/assets/508043/17109627/c72b8406-5266-11e6-9799-1ed3742e1eda.png" height="36">

Unclean, committed once, but not pushed yet:

<img src="https://cloud.githubusercontent.com/assets/508043/17109626/c72b40ea-5266-11e6-8b8a-7bc7a9085ce5.png" height="36">

Clean and two commits awaiting to be pushed:

<img src="https://cloud.githubusercontent.com/assets/508043/17109628/c72c2d98-5266-11e6-984a-d2409d22aa83.png" height="36">

## Install

### Configure Terminal

- First install your favorite [base16 theme](https://chriskempson.github.io/base16/) for your favorite terminal app. My personal preference is `Solarized Base16` theme for `iTerm2` which you can find from [here](https://github.com/chriskempson/base16-iterm2).

- Browse to `fonts` directory and install all `FiraCode` fonts.

- Go to iTerm `Preferences > Profiles > Text` and use `Fira Code` font for both `Font` and `Non-ASCII Font`.

### Install Dotfiles

Make sure you have python installed. Then clone this repository into your home folder:

	git clone git@github.com:mislam/dotfiles.git ~/.dotfiles

Run the installer script:

	~/.dotfiles/scripts/install.sh

Enjoy!
