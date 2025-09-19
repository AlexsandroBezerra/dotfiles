# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/alexsandro/.zsh/completions:"* ]]; then export FPATH="/home/alexsandro/.zsh/completions:$FPATH"; fi

# Profile
source $HOME/.profile

# Editor
export EDITOR="nvim"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alexsandro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zinit Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Sparragus/zsh-auto-nvm-use

# Starship
eval "$(starship init zsh)"

# Aliases
alias g=git
alias cat=bat
alias k=kubectl
alias heap='export NODE_OPTIONS=--max_old_space_size=8192'

function quanta {
    session_name="quanta"

    if tmux has-session -t $session_name 2>/dev/null; then
        if [ -n "$TMUX" ]; then
          tmux switch-client -t "$session_name"
        else
          tmux attach -t "$session_name"
        fi
    else
        source quanta-npm-login quanta
        if [ -n "$TMUX" ]; then
          aws-vault exec quanta -d 8h -- tmux new-session -d -s "$session_name" && tmux switch-client -t "$session_name"
        else
          aws-vault exec quanta -d 8h -- tmux new-session -s "$session_name"
        fi
    fi
}

# My functions
function git-cleanup() {
  git branch --merged | grep -Ev "(^\*|^\+|master|main|dev)" | xargs --no-run-if-empty git branch -d
}

# SDKMan
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Deno
. "/home/alexsandro/.deno/env"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/alexsandro/.lmstudio/bin"
# End of LM Studio CLI section

