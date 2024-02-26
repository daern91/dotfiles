eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(github-copilot-cli alias -- "$0")"

# gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh
autoload -Uz compinit
autoload bashcompinit && bashcompinit
compinit -i

# gpg-shortcuts
alias gpg-upload-keys='gpg --send-key $KEYID && gpg --keyserver keys.gnupg.net --send-key $KEYID && gpg --keyserver hkps://keyserver.ubuntu.com:443 --send-key $KEYID'
alias gpg-change-card='gpg-connect-agent "scd serialno" "learn --force" /bye'

# alias rsDC='pkill Docker && open -a Docker && docker compose up'
alias gbDA='git branch | egrep -v "(master|\*)" | xargs git branch -D'

alias gck='git checkout $(git branch | fzf)'
alias gcd='git branch -d $(git branch | fzf)'
# alias g='git add . && git commit -m "progress" && git push origin main' 
alias g='git add -A && git commit -m "progress" && git push &> /dev/null' 
alias openbb='"/Applications/OpenBB Terminal/OpenBB Terminal"'

ghic() {
	gh issue close $(gh issue list -a daern91 | fzf | awk '{if ($1 !="") print $1}') 
}
ghiv() {
	gh issue view $(gh issue list -a daern91 | fzf | awk '{if ($1 !="") print $1}') 
}
ghbc() {
	git checkout -b $(gh issue list -a daern91 | fzf | tr -s '[:punct:]' ' ' | cut -d '	' -f1 -f3 | awk '{$1=$1};1' | tr -s '[:blank:]' '-' | tr '[:upper:]' '[:lower:]') 
}

gst() {
  git stash apply $(git stash list | fzf | awk '{print$1}' | rev | cut -c 2- | rev)
}

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

alias tma='tmux attach -t $(tmux ls | fzf | cut -d ':' -f1)'
alias vif='vim $(fzf --height 40%)'
alias python='python3'

if $(command -v exa > /dev/null); then 
	alias l='exa'
	alias ls='exa'
	alias ll='exa -l'
	alias lll='exa -la'
else 
	alias l='ls'
	alias ll='ls -l'
	alias lll='ls -la';
fi

if $(command -v bat > /dev/null); then 
	alias cat='bat'
else 
	# alias lll='ls -la';
fi

# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
eval "$(zoxide init --cmd j zsh)"

bindkey -e
export EDITOR=vim
export LC_ALL=en_GB.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPTS='--height 40%'

source ~/variables.sh

# [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell
alias tf="terraform"
alias k="kubectl"
complete -F __start_kubectl k
# plugins=(git git-flow brew history node npm kubectl zsh-autosuggestions)
plugins=(git git-flow brew history node npm kubectl)

alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'

eval "$(starship init zsh)"
export PATH="/usr/local/opt/libpq/bin:$PATH"

source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export GPG_TTY=$(tty)

export PATH=/opt/homebrew/bin:$PATH

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

export PATH="/Users/daniel/Library/Python/3.10/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/daniel/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
