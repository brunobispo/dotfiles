## Dependencies

- Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- ohmyzsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## Install

Install Homebrew-based dependencies:

    brew install --cask kitty
    brew install gcc \
                 zsh zsh-completions jandedobbeleer/oh-my-posh/oh-my-posh \
                 asdf \
                 nvim python3 luarocks ripgrep live-grep \
                 tmux

Clone onto your home directory

    git clone https://github.com/brunobispo/dotfiles ~/dotfiles

Install [rcm](https://github.com/thoughtbot/rcm)

    brew tap thoughtbot/formulae
    brew install rcm

Symlink the dotfiles

    env RCRC=$HOME/dotfiles/rcrc rcup
