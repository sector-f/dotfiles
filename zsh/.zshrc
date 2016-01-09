#Needed for Termite
eval $(dircolors ~/.dircolors)

#Get keybinds set because zsh doesn't use inputrc
typeset -A key

bindkey '^r' history-incremental-search-backward
# key[Home]=${terminfo[khome]}
# key[End]=${terminfo[kend]}
# key[Insert]=${terminfo[kich1]}
# key[Delete]=${terminfo[kdch1]}
# key[Up]=${terminfo[kcuu1]}
# key[Down]=${terminfo[kcud1]}
# key[Left]=${terminfo[kcub1]}
# key[Right]=${terminfo[kcuf1]}
# key[PageUp]=${terminfo[kpp]}
# key[PageDown]=${terminfo[knp]}

# # setup key accordingly
# [[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
# [[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
# [[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
# [[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
# [[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
# [[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
# [[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
# [[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
# [[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
# [[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

#Set aliases
alias 'ls'='ls --color=auto'
alias 'pg'='ping -c 1 google.com | grep packet'
alias 'll'='ls -l'
alias 'la'='ls -Al'
alias 'please'='sudo $(fc -ln -1)'
alias 'n'='ncmpcpp'
alias 'screenfetch'='screenfetch -a lambda'
# alias 'cava'='cava -i fifo -p /tmp/mpd.fifo -b 15'
alias 'cava'='cava -i fifo -p /tmp/mpd.fifo'
alias ':q'='exit'

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

# The following lines were added by compinstall
zstyle :compinstall filename '/home/adam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load prompt file
source ~/.prompt.zsh

# source ~/.zsh-syntax-highlighting.zsh
