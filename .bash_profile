test -e "${HOME}/.iterm2_shell_integration.sh" && \
  source "${HOME}/.iterm2_shell_integration.sh" && \
  source ~/.profile;
drawline() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' ―;
}
get_time() {
  printf "$(date +'%Y-%m-%d %I:%M %p')";
}
get_vcs_branch() {
  vcs_info;
  if [ -n "$vcs_info_msg_0_" ]; then
    echo `printf $vcs_info_msg_0_ | cut -f 2 -d '-'`;
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
    printf "⎸💡  $(printf "$vcs_info_msg_0_" | cut -f 2 -d '-') ⎸";
  fi;
}
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/} $(get_branch)\a";
}
get_branch() {
  CURRENT_BRANCH=$(git branch &>/dev/null);
  if [[ $? = "0" ]]; then
    printf "[`printf $(git branch | grep '*' | cut -f 2 -d '*')`]";
  fi;
}
PS1=$'\[\e]0;\W $(get_branch)\a\]\n\e[90m\e[37m\e[1m$(drawline)\n⎸𝔟𝖆𝖘𝔥 ⎸📆  $(get_time) ⎸ 📂  $(pwd) $(get_branch)\n\e[0m\e[36m\e[35m⢈\e[31m⢨⢘\e[91m⢈⢸⠨\e[33m⠸⢈\e[32m⢨\e[36m⢘\e[94m⢈ \e[37m$\e[0m ';

