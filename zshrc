# ~/.zshrc
# Enhanced with starship (https://starship.rs/) - Added at the end of the file
# Anvesh G. Jhuboo

# Use zsh-autosuggestions, zsh-syntax-highlighting 
# [apt|dnf] install zsh zsh-autosuggestion zsh-syntax-highlighting

# Change the default theme
# ZSH_THEME="agnoster"
unsetopt beep nomatch

# Customize the prompt
# PROMPT='%{%F{green}%}[%n@%m%{%F{yellow}%} %~]$(git_prompt_info)%{%f%}%(!.%{%F{red}%}.%{%F{green}%})%# %{%f%}'

# Set your default editor
alias vim=nvim
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Set your preferred language and region
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# Case insensitive tab completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'm:{a-zA-Z}={A-Za-z} r:|=* l:|=*'

# Autocomplete improvements
# setopt COMPLETE_IN_WORD
# setopt AUTO_MENU
# unsetopt MENU_COMPLETE
setopt NO_LIST_BEEP
setopt AUTO_CD
setopt AUTO_PUSHD

# Better ls with colors
alias ls="ls --color=auto"
alias l="ls -CF"
alias ll="ls -lh"
alias la="ls -Al"

# General aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Git aliases
alias g="git"
alias gs="git status"
alias gl="git log"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpu="git pull"
alias grm="git rm"
alias gmv="git mv"
alias gm="git merge"
alias gcl="git clone"
alias gr="git remote"
alias greset="git reset"
alias grb="git rebase"
alias gstash="git stash"
alias gtag="git tag"

# Start zsh: (https://github.com/ohmyzsh/ohmyzsh/wiki/Settings)
# source $ZSH/oh-my-zsh.sh

# Initialize .profile
source "$HOME/.profile"

# Homebrew (MacOS Silicon)
# eval "$(/opt/homebrew/bin/brew shellenv)"

##################################################
# Startship (https://starship.rs/)
##################################################
eval "$(starship init zsh)"

