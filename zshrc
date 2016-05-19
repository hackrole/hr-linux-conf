# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

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
plugins=(git pip cabal celery docker encode64 fabric gem httpie jsontools node npm tmux vagrant virtualenvwrapper)

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

export ZSH_ALIAS="~/.alias"
source ~/.alias
# [ -s $ZSH_ALIAS ] && . $ZSH_ALIAS

# setup oepnjdk 7
export JAVA_HOME=/home/daipeng/app/jdk7
export JRE_HOME=${JAVA_HOME}/jre
export PATH=${JAVA_HOME}/bin:${PATH}
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export CLASSPATH=${CLASSPATH}:${JAVA_HOME}/lib/bsh.jar

# sdkman for manager java/scala/groovy/gradle.. version
source "/home/daipeng/.sdkman/bin/sdkman-init.sh"

# setup android sdk
export ANDROID_HOME=/home/daipeng/app/android-sdk-linux
export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# setup android ndk
export ANDROID_NDK=/home/daipeng/app/android-ndk

# setup scala
export SCALA_HOME="/home/daipeng/app/scala-2.11.7"
export PATH=$PATH:${SCALA_HOME}/bin

# setup golang
export GOROOT="/home/daipeng/app/go1.6"
export GOPATH="/home/daipeng/goprojects/mygo1.6"
export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin

# setup gradle
export GRADLE_HOME="/home/daipeng/app/gradle-2.10/"
export PATH=${PATH}:${GRADLE_HOME}/bin

# setup virtualenvwapper
export VIRTUALENV_WRAPPER_BIN="/usr/local/bin/virtualenvwrapper.sh"
[ -s $VIRTUALENV_WRAPPER_BIN ] && . $VIRTUALENV_WRAPPER_BIN

# setup bro path
export PATH=${PATH}:/usr/local/bro/bin

# setup nvm
export NVM_DIR="/home/daipeng/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# use v4.2.2 node at startup
#nvm use v4.2.2

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/daipeng/.sdkman"
[[ -s "/home/daipeng/.sdkman/bin/sdkman-init.sh" ]] && source "/home/daipeng/.sdkman/bin/sdkman-init.sh"

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/home/daipeng/.jenv/bin/jenv-init.sh" ]] && source "/home/daipeng/.jenv/bin/jenv-init.sh" && source "/home/daipeng/.jenv/commands/completion.sh"
