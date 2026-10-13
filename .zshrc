eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ooo/.zshrc'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias zshrc="vi ~/.zshrc"
alias zsource="source ~/.zshrc"
alias c="clear"
alias ls="ls --color"
alias ll="ls -hl"
alias la="ls -a"
alias lla="ls -hla"
alias ldot="ls -d .??*"
alias cp="cp -i"
alias gac="git add . && git commit -m"
alias pacbak="pacman -Qqen >| $HOME/.dotfiles/pkglist.txt && pacman -Qqem >| $HOME/.dotfiles/pkglist_aur.txt"
alias vi="vim"
alias py="python"
alias cat="bat --style plain"
alias grep="grep --color=auto -P"

set -o noclobber
set -o autocd

# fnm
FNM_NODE_DIST_MIRROR="https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/"
FNM_PATH="/home/ooo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/ooo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
FNM_PATH="/home/ooo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# uv
. "$HOME/.local/bin/env"

# Added by uv-installer: use CNB mirror for uv python install
export UV_PYTHON_INSTALL_MIRROR="https://cnb.cool/astral-sh/python-build-standalone/-/releases/download"

# Added by uv-installer: use CNB astral mirror
export UV_ASTRAL_MIRROR_URL="https://cnrio.cn/"
