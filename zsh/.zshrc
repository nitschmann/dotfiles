# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby tmux syntax-highlighting homebrew rake npm nvm ndenv grunt revel)

source $ZSH/oh-my-zsh.sh

# User configuration
# export PATH="~/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH="~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:~/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# load all custom configs
for file in "${ZDOTDIR:-$HOME}"/.zsh/*.zsh; do
  source "${ZDOTDIR:-$HOME}/.zsh/${file:t}"
done

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# GO
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/code/go

# Node.js and NPM
export PATH=/usr/local/share/npm/bin:$PATH

NPM_PACKAGES="$HOME/.npm-packages"
if [ -d $NPM_PACKAGES ]; then
  NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
  PATH="$NPM_PACKAGES/bin:$PATH"

  # Unset manpath so we can inherit from /etc/manpath via the `manpath`
  # command
  unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
  MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
fi

# NVM
NVM_DIR="$HOME/.nvm"
if [ -d $NVM_DIR ]; then
  export $NVM_DIR
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

NDENV_DIR="$HOME/.ndenv"
if [ -d $NDENV_DIR ]; then
  export PATH=$NDENV_DIR/bin:$PATH
fi

# LUNCHY
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
  if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
    . $LUNCHY_DIR/lunchy-completion.zsh
  fi

eval `/usr/libexec/path_helper -s`

# Postgres.app (only Mac OSX)
if [ -d "$PATH:/Applications/Postgres.app/Contents/Versions/9.4" ]; then
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
fi
