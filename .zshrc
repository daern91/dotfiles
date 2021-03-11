autoload -Uz compinit
autoload bashcompinit && bashcompinit
compinit

eval $(thefuck --alias)

alias gbDA='git branch | egrep -v "(master|\*)" | xargs git branch -D'

alias gck='git checkout $(git branch | fzf)'

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
alias tma='tmux attach -t $(tmux ls | fzf | cut -d ':' -f1)'
alias vif='vim $(fzf --height 40%)'

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

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Users/deriksson/n/bin:/Users/deriksson/.npm-global/bin:$HOME/.cargo/bin:$PATH


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

bindkey -e
export EDITOR=vim
export LC_ALL=en_GB.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPTS='--height 40%'

source ~/variables.sh
# [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell
alias k="kubectl"
complete -F __start_kubectl k
plugins=(git git-flow brew history node npm kubectl)

alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'

eval "$(starship init zsh)"
