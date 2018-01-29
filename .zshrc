test -e "${HOME}/.iterm2_shell_integration.zsh" && \
  source "${HOME}/.iterm2_shell_integration.zsh" && \
  source ~/.profile;

autoload -Uz vcs_info;
setopt PROMPT_SUBST;
zstyle ':vcs_info:*' enable git cvs svn;
drawline() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' ―;
}
get_time() {
  printf "$(date +'%Y-%m-%d %I:%M %p')";
}
get_vcs_branch() {
  vcs_info;
  if [ -n "$vcs_info_msg_0_" ]; then
    echo `printf "${vcs_info_msg_0_}" | cut -f 2 -d '[' | cut -f 1 -d ']'`;
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
    printf "⎸💡  $(printf "$vcs_info_msg_0_") ⎸";
  fi;
}
precmd() {
  # sets the tab title to current dir
  vcs_info;
  echo -ne "\e]1;${PWD##*/} $(get_vcs_branch)\a";
}
PROMPT=$'\n%{\e[90m%}%{\e[37m%}%{\e[1m%}$(drawline)⎸ 𝒛𝖘𝔥 ⎸📆  $(get_time) ⎸ 📂  ${PWD/} %{\e[0m% [ %{\e[32m% $(get_vcs_branch) %{\e[0m% ] %{\e[0m%} \n%{\e[36m%}%{\e[35m%}⢈%{\e[31m%}⢨⢘%{\e[91m%}⢈⢸⠨%{\e[33m%}⠸⢈%{\e[32m%}⢨%{\e[36m%}⢘%{\e[94m%}⢈ %{\e[37m%}$\ %{\e[0m%} '
ZLE_RPROMPT_INDENT=0

