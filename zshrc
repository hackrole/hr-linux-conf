# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras cabal celery docker encode64 fabric gem httpie jsontools node npm tmux vagrant kubectl pass)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# personal config
# ===============

# history config
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt no_share_history

export ZSH_ALIAS="~/.alias"
source ~/.alias
# [ -s $ZSH_ALIAS ] && . $ZSH_ALIAS



# homebrew github token
export HOMEBREW_GITHUB_API_TOKEN="828a4eb4be3e43a2bc728d15224d010dba9caa4b"

# setup nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# use v4.2.2 node at startup
#nvm use v4.2.2

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


# google cloud sdk
export PATH=$HOME/app/google-cloud-sdk/bin/:$PATH

# ====================
# [ use sdkman to manage java/scala/android ]
# ====================
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# setup oepnjdk 7
#export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home'
#export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
#export JRE_HOME=${JAVA_HOME}/jre
#export PATH=${JAVA_HOME}/bin:${PATH}
#export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
#export CLASSPATH=${CLASSPATH}:${JAVA_HOME}/lib/bsh.jar
export JAVA_HOME=/Users/daipeng/.sdkman/candidates/java/current

# setup android sdk
#export ANDROID_HOME=$HOME/app/android-sdk-linux
#export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
export PATH="${PATH}:/opt/android-studio/bin"
# flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH="${PATH}:/opt/flutter/bin"

# setup android ndk
#export ANDROID_NDK=$HOME/app/android-ndk

# setup scala
#export SCALA_HOME="$HOME/app/scala-2.11.7"
#export PATH=$PATH:${SCALA_HOME}/bin


# setup gradle
#export GRADLE_HOME="$HOME/app/gradle-2.10/"
#export PATH=${PATH}:${GRADLE_HOME}/bin

# ========================
# [use asdf to manage python/golang/nodejs/ruby/rust]
# ========================
# asdf config
#[ -s "${HOME}/.asdf" ] && source "${HOME}/.asdf/asdf.sh" && source "${HOME}/.asdf/completions/asdf.bash"
# enable asdf, for virtualenv for nodejs/erlang/elixir and so on
[[ -s "$HOME/.asdf/asdf.sh" ]] && source $HOME/.asdf/asdf.sh
#[[ -s "$HOME/.asdf/completions/asdf.bash" ]] && source $HOME/.asdf/completions/asdf.bash

##  haskell config
# stack complete
#eval "$(stack --bash-completion-script stack)"

##  haskell config
# stack complete
#eval "$(stack --bash-completion-script stack)"

##  haskell config
# stack complete
#eval "$(stack --bash-completion-script stack)"

# setup virtualenvwapper
export VIRTUALENV_WRAPPER_BIN="${HOME}/.asdf/installs/python/3.8.2/bin/virtualenvwrapper.sh"
[ -s $VIRTUALENV_WRAPPER_BIN ] && . $VIRTUALENV_WRAPPER_BIN

# setup golang
#export GOROOT="$HOME/app/go1.6"
#export GOPATH="$HOME/projects/mygo"
#export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin
# golang virtualenv vg
#command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"
export GOROOT="$HOME/.asdf/installs/golang/1.13.8/go"
export GOPATH="$HOME/projects/mygo"
export PATH="${GOPATH}/bin:${PATH}"
export GOTOOLDIR="$HOME/.asdf/installs/golang/1.13.8/go/pkg/linux_amd64/"

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
#[[ -s "$HOME/.jenv/bin/jenv-init.sh" ]] && source "$HOME/.jenv/bin/jenv-init.sh" && source "$HOME/.jenv/commands/completion.sh"
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"
#
#[[ -s "$HOME/.nodenv/" ]] && export PATH="$HOME/.nodenv/bin:$PATH" && export PATH="$HOME/.nodenv/bin:$PATH"
#eval "$(nodenv init -)"

# config ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(ssh-agent -s)
fi
if [ -e "~/.ssh/id_rsa" ]; then
    ssh-add ~/.ssh/id_rsa
fi
if [ -e "~/works/dmp-key.pem" ]; then
    ssh-add ~/works/dmp-key.pem
fi

# config autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# config fasd
#eval "$(fasd --init auto)"

# java env
export PATH="/usr/local/opt/scala@2.11/bin:$PATH"

# rust-up path
export PATH="/Users/daipeng/.cargo/bin:${PATH}"
# autojump
[[ -s /home/hackrole/.autojump/etc/profile.d/autojump.sh ]] && source /home/hackrole/.autojump/etc/profile.d/autojump.sh

# vagrant config
export VAGRANT_HOME=/data/vagrant

# devpi server dir
export DEVPI_SERVERDIR="/data/devpi_server"

# direnv
#eval "$(direnv hook zsh)"

# export editor
export EDITOR='vim'
# tmuxinator init
#export tmuxinator_zsh_compl="/home/hackrole/.asdf/installs/ruby/2.5.1/lib/ruby/gems/2.5.0/gems/tmuxinator-0.11.2/completion/tmuxinator.zsh"
#source $tmuxinator_zsh_compl
# tmuxp init
#eval "$(_TMUXP_COMPLETE=source tmuxp)"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/hackrole/Downloads/nodenv/versions/8.4.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/hackrole/Downloads/nodenv/versions/8.4.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

# auto notify use ntfy when long-running command finish
# install with pip install 'ntfy[telegram]'
# eval "$(ntfy shell-integration -f)"

PATH="/Users/daipeng/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/daipeng/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/daipeng/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/daipeng/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/daipeng/perl5"; export PERL_MM_OPT;
# disable vim freeze
stty -ixon

# command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"
#export PATH="$PATH:/opt/mssql-tools/bin"
# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
export PATH=$PATH:$HOME/.linkerd2/bin

# direnv
#eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/vault_0.11.4/vault vault

# added by travis gem
[ -f /home/hackrole/.travis/travis.sh ] && source /home/hackrole/.travis/travis.sh

complete -o nospace -C /usr/local/bin/consul consul

complete -o nospace -C /home/hackrole/projects/mygo/bin/mc mc

complete -o nospace -F /usr/local/bin/aliyun aliyun

# arcanist config
#export PATH="$PATH:/opt/phabricator/arcanist/bin/"
# or in home dir
#export PATH=${PATH}:${HOME}/.mozbuild/arcanist/bin

#source <(\kaf completion zsh)

export PATH=${HOME}/.local/bin:${PATH}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#source ~/.zplug/init.zsh

#zplug 'wfxr/forgit'

# hadoop
export HADOOP_VERSION=3.1.4
export HADOOP_HOME=$HOME/apps/hadoop-3.1.4
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export YARN_HOME=$HADOOP_HOME
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME
export HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec
export JAVA_LIBRARY_PATH=$HADOOP_HOME/lib/native:$JAVA_LIBRARY_PATH
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
 
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
