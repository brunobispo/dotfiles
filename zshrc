export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# Oh My Zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Theme
eval "$(oh-my-posh init zsh --config '~/.bbispo.omp.json')"

# Asdf
. $(brew --prefix asdf)/libexec/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh 2>/dev/null
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh 2>/dev/null

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Secrets
. ~/.secrets 2>/dev/null || true
