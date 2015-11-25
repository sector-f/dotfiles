# bindkey -v
# export KEYTIMEOUT=1

autoload -U colors && colors
autoload -U promptinit
autoload -Uz vcs_info
promptinit
vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

PROMPT="%{$fg_bold[green]%}[%~]%{$reset_color%} \$vcs_info_msg_0_
%{$fg_bold[yellow]%}>>%{$reset_color%} "

zstyle ':vcs_info:git:*' formats "%{$fg_bold[yellow]%}%b%{$reset_color%}"
