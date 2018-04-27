## initialise with message
printf -- "\n\033[90m.ZSHRC.";

## iterm integration checks
printf -- 'ITERM-';
_=$(stat ${HOME}/.iterm2_shell_integration.zsh &>/dev/null);
if [ "$?" = "0" ]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh";
  source "${HOME}/.iterm2_shell_integration.zsh";
  printf -- 'Y.';
else
  printf -- 'N.';
fi;

## .profile loading
stat ${HOME}/.profile &>/dev/null && source ~/.profile;

## zsh specific stuff
autoload -Uz vcs_info;
setopt PROMPT_SUBST;
zstyle ':vcs_info:*' enable git cvs svn;
drawline() {
  printf '\033[4m%*s\033[0m\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' ' ';
}
get_time() {
  printf "$(date +'%Y-%m-%d %I:%M %p')";
}
get_vcs_branch() {
  vcs_info;
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "\033[0m\033[32m$(printf "$vcs_info_msg_0_" | cut -f 1 -d ']' | cut -f 2 -d '[')\033[0m";
  fi;
}
vcs_info_wrapper() {
  vcs_info;
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}$(get_vcs_branch)%{$reset_color%}$del";
  fi
}
get_status_bar_vcs_info() {
  vcs_info;
  if [ -n "$vcs_info_msg_0_" ]; then
    printf "⎸💡  $(printf "\033[32m$vcs_info_msg_0_\033[0m") ⎸";
  fi;
}
precmd() {
  vcs_info;
  echo -ne "\033]1;${PWD##*/} $(get_vcs_branch)\a";
}

PROMPT=$'\n%{\033[90m%}%{\033[37m%}%{\033[1m%}$(drawline)\033[0m⎸ 𝒛𝖘𝔥 ⎸📆  $(get_time) ⎸📂  ${PWD/} ⎸$(get_vcs_branch) %{\033[0m%} \n%{\033[36m%}%{\033[35m%}⢈%{\033[31m%}⢨⢘%{\033[91m%}⢈⢸⠨%{\033[33m%}⠸⢈%{\033[32m%}⢨%{\033[36m%}⢘%{\033[94m%}⢈ %{\033[37m%}$\ %{\033[0m%} '
ZLE_RPROMPT_INDENT=0
