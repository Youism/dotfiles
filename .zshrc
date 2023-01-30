# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export all_proxy=https://127.0.0.1:7890
export   TERM=xterm-256color
export  theme_short_path=yes
export   GUILE_AUTO_COMPILE=0
# aliases

alias ls="exa"
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -lha"
alias lla="ll -A"
alias bi="brew install"
alias bic="brew install --cask"
alias b="brew"
alias py="python3"
alias op=open
# git command alias
alias g=git
alias ga="git add"
alias ga.="git add ."
alias gm="git commit -m"
alias gl="git log"
alias gt="git status"
alias gb="git branch"
alias gd="git diff"
alias gs="git switch"
alias vi=nvim
alias cd..="cd .."
alias tnew="tmux new -s"
alias cl="clear"
alias mk="mkdir"
alias gll="git log --graph --decorate --oneline --all"
export  PATH=/usr/bin:$PATH
export  PATH=/bin:$PATH
export  PATH=/usr/local/sbin:$PATH

# export  PATH $HOME/.cargo/bin $PATH
export HOMEBREW_NO_AUTO_UPDATE=1

export   PATH=/usr/localwbin:$PATH
export   PATH=/opt/homebrew/bin:$PATH
export   PATH=/opt/homebrew/sbin:$PATH
export   PATH=/Users/pengyo/Library/Python/3.10/bin:$PATH
export   PATH=/Users/pengyo/.cargo/bin:$PATH
export   PATH=/opt/homebrew/opt/llvm/bin:$PATH
export   LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export   CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export  HOMEBREW_NO_AUTO_UPDATE=1
export  all_proxy=socks5://127.0.0.1:7890
git config --global http.proxy socks5://127.0.0.1:7890
git config --global https.proxy socks5://127.0.0.1:7890
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
eval "$(starship init zsh)"
