Dependencies
------------

* Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Install
-------

Install Homebrew-based dependencies:

	brew install --cask kitty
	brew install gcc zsh oh-my-zsh asdf python3 luarocks ripgrep nvim tmux

Clone onto your home directory

	git clone https://github.com/brunobispo/dotfiles ~/dotfiles

Install [rcm](https://github.com/thoughtbot/rcm)

	brew tap thoughtbot/formulae
	brew install rcm

Symlink the dotfiles

	env RCRC=$HOME/dotfiles/rcrc rcup


