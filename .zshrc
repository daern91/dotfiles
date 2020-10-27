eval $(thefuck --alias)

alias gbDA='git branch | egrep -v "(master|\*)" | xargs git branch -D'

alias gck='git checkout $(git branch | fzf)'
gst() {
    git stash apply $(git stash list | fzf | awk '{print$1}' | rev | cut -c 2- | rev)
}
alias tma='tmux attach -t $(tmux ls | fzf | cut -d ':' -f1)'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export LC_ALL=en_GB.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

source ~/variables.sh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell

alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'

eval "$(starship init zsh)"
