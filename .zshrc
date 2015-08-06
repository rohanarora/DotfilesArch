# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias virtual="source ~/rithmio/repo/env/bin/activate"
alias project="cd ~/rithmio/repo"
alias ml="cd ~/SpiderOak/ML-Project"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Fix for could not open a connection to your authentication agent on ssh-add
# eval $(ssh-agent)
# ssh-add runs when needed and is destroyed afterwards
# ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Android Developer SDK
export ANDROID_SDK=$HOME/android/android-sdk-linux
export ANDROID_NDK=$HOME/android/android-ndk-r10e

export ANACONDA=/home/rohanarora/anaconda

# Neuron Setup
# export IV=$HOME/CSL/NEURON/iv
# export N=$HOME/CSL/NEURON/nrn
# export CPU=x86_64
# export PATH=$IV/$CPU/bin:$N/$CPU/bin:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$PYTHON2:$RUBY_GEM:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:$PATH

# bin for python2
export PYTHON2=$HOME/bin

export RUBY_GEM=$HOME/.gem/ruby/2.1.0/bin

export GOPATH=~/go
# for build tool for Scala
#export SCALA_SBT=$HOME/external/bigdata/sbt

export PATH=$ANACONDA/bin:$GOPATH/bin:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$ANDROID_NDK:$PYTHON2:$RUBY_GEM:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:$PATH

export QT_SELECT=4


# Alias for pacman
alias pacupg='sudo pacman -Syu'	# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacmir='sudo pacman -Syy'	# Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
