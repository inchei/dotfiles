# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/root/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
## Zsh aliases
alias zshrc="vi ~/.zshrc"
alias zshre="source ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
## Pacman aliases
alias pacupg="pacman -Syu"
alias pacin="pacman -S"
alias pacins="pacman -Up"
alias pacre="pacman -R"
alias pacrem="pacman -Rns"
alias pacrep="pacman -Si"
alias pacreps="pacman -Ss"
alias pacc="pacman -Sc"
alias pacloc="pacman -Qi"
alias paclocs="pacman -Qs"
alias pachm="pacman -Q | wc -l"
## Modified commands
alias diff="icdiff"
alias grep="grep --color=auto"
alias vimrc="vi ~/.vimrc"
alias vi="vim"
alias py="python"
alias py2="python2"
alias py3="python3"
alias ipy="ipython"
alias django="django-admin"
alias https="http --default-scheme=https"
## ls
alias ls="ls -hF"
alias lr="ls -R"
alias ll="ls -l"
alias la="ll -A"
alias lx="ll -BX"
alias lz="ll -rS"
alias lt="ll -rt"
alias lm="la | more"
## Safe mode
alias rm="rm -i"
## GitHub
alias gamp="sh ~/shell/gamp.sh"
alias ghpages="/mnt/c/Users/inchei/Documents/GitHub/inchei.github.io"
alias dotfiles="/mnt/c/Users/inchei/Documents/GitHub/dotfiles"

alias ei="easy_install"
eval $(thefuck --alias)

# zstyle
## Colorful output
### Red warnings
zstyle ":completion:*:warnings" format $"\e[01;31m -- No Matches Found --\e[0m"
### Light descriptions
zstyle ":completion:*:descriptions" format $"\e[2m -- %d --\e[0m"
zstyle ":completion:*:corrections" format $"\e[01;33m -- %d (errors: %e) --\e[0m"

## Display by groups
zstyle ":completion:*" group-name ""

zstyle ":completion:*" rehash true
autoload -U compinit
compinit
autoload -U promptinit
promptinit

# Hsitory
## No dups
setopt hist_save_no_dups
setopt hist_ignore_dups
## Ignore commands by spaces
setopt hist_ignore_space

# Obsessive
pacupg

# FIXME
# Automatically restart zsh after writing .zshrc.

# if [ !! == zshrc ]
# then
#     zshre
# fi


