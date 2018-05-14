#Needed for Termite
if [[ -f ~/.dircolors ]]; then
	eval $(dircolors ~/.dircolors)
fi

#Get keybinds set because zsh doesn't use inputrc
typeset -A key

bindkey '^r' history-incremental-search-backward

#Set aliases
alias 'ls'='ls --color=auto'
alias 'grep'='grep --color=auto'
alias 'll'='ls -l'
alias 'la'='ls -Al'
alias 'please'='sudo $(fc -ln -1)'
alias 'n'='ncmpcpp'
alias 'screenfetch'='screenfetch -a lambda'
# alias 'cava'='cava -i fifo -p /tmp/mpd.fifo -b 15'
# alias 'cava'='cava -i fifo -p /tmp/mpd.fifo'
alias ':q'='exit'
# alias 'du'='cdu -isdhD'

todo() {
	todofile="$HOME/todo"
	case "$1" in
		<->)
			grep -v '^#' "$todofile" | shuf -n "$1"
			;;
		all)
			more "$todofile"
			;;
		edit)
			"${VISUAL:-${EDITOR:-vi}}" "$todofile"
			;;
		*)
			grep -v '^#' "$todofile"
			;;
	esac
}

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# The following lines were added by compinstall
zstyle :compinstall filename '/home/adam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load prompt file
source ~/.prompt.zsh

# source ~/.zsh-syntax-highlighting.zsh

sprunge() {
	if [ -z "$@" ]; then
		curl -sF "sprunge=$(< /dev/stdin)" http://sprunge.us;
	else
		for file in "$@"; do
			curl -sF "sprunge=@${file}" http://sprunge.us;
		done;
	fi
}

setopt interactivecomments
