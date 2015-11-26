autoload -U colors && colors
autoload -U promptinit
autoload -Uz vcs_info
promptinit

# git repo stuff

vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "%{$fg_bold[yellow]%}%b%{$reset_color%}"

# vi mode stuff

bindkey -v
export KEYTIMEOUT=1

function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      VI_MODE="%{$fg_bold[red]%}[NORMAL]%{$reset_color%}" ;;
      (main|viins) VI_MODE="%{$fg_bold[red]%}[INSERT]%{$reset_color%}" ;;
      (*)          VI_MODE="%{$fg_bold[red]%}[INSERT]%{$reset_color%}" ;;
    esac
	PROMPT="$VI_MODE %{$fg_bold[green]%}[%d]%{$reset_color%} \$vcs_info_msg_0_
%{$fg_bold[yellow]%}>>%{$reset_color%} "
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select








