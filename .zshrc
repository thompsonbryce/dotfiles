# early, fast invocation of tmux
# - only if tmux is installed
# - not in linux ttys
# - no nested tmux sessions
#if [[ -n ${commands[tmux]} && "$TERM" != "linux" && -z "$TMUX" && "$INSIDE_EMACS" != "vterm" ]]; then
#  if [[ -n "$SSH_AUTH_SOCK" ]]  then
#    tmux set-environment -g SSH_AUTH_SOCK "$SSH_AUTH_SOCK" 2>/dev/null
#  fi
#  tmux new-session -s "${TTY:t}" -t main || tmux attach-session -t "${TTY:t}"
#fi

####################
# zinit

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -U compinit && compinit

autoload -Uz vcs_info
precmd(){vcs_info}

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%n%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
bindkey -s ^f "~/dotfiles/scripts/tmux-sessionizer\n"
bindkey '^H' backward-kill-word
bindkey "^[[3~" delete-char
bindkey "5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
zle -N killp{,}
bindkey "^[Q" killp
bindkey '^[[Z' autosuggest-accept

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME/dotfiles'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alG'
alias ls='ls --color=auto'
alias azuritelocal='~/dotfiles/scripts/azurite.sh'
alias voteapi="tmux new-session -s voteapi -c ~/dev/VoteAppSwa/src/Api 'func host start'"
alias zshrc="nvim ~/.zshrc"
alias lg="lazygit"
alias ..="cd .."
killp() {
    local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
    if [[ "$pid" != "" ]]; then
        echo $pid | xargs sudo kill -${1:-9}
    fi
}

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/robbyrussel.yaml)"

# Path modifications
export PATH="$PATH:/opt/azure-functions-cli"
