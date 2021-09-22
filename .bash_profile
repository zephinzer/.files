## initialise with message
printf -- "\n\033[90m.BASH_PROFILE.";

## iterm integration checks
printf -- 'ITERM-';
_=$(stat ${HOME}/.iterm2_shell_integration.zsh &>/dev/null);
if [ "$?" = "0" ]; then
  test -e "${HOME}/.iterm2_shell_integration.sh";
  source "${HOME}/.iterm2_shell_integration.sh";
  printf -- 'Y.';
else
  printf -- 'N.';
fi;

## .profile loading
[ -e "${HOME}/.profile" ] && source "${HOME}/.profile";

## awscli command completion
which aws_completer &>/dev/null && complete -C $(which aws_completer) aws;

## bash specific stuff
drawline() {
  printf '\e[4m%*s\e[0m\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' ' ';
}
get_time() {
  printf "$(date +'%Y-%m-%d %I:%M %p')";
}
get_vcs_branch() {
  vcs_info;
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "\e[0m\e[32m$(printf "$vcs_info_msg_0_" | cut -f 1 -d ']' | cut -f 2 -d '[') \e[0m";
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
  echo -ne "\e]1;${PWD##*/} $(get_branch)\a";
}
get_branch() {
  CURRENT_BRANCH=$(git branch &>/dev/null);
  if [ "$?" = "0" ]; then
    CURRENT_BRANCH="$(git branch | grep '*' | cut -f 2 -d '*')";
    printf -- "⎸\e[0m\e[32m${CURRENT_BRANCH}\e[0m";
  fi;
}
PS1=$'\[\a\]\[\n\]\[\e[90m\]\[\e[37m\]\[\e[1m\]$(drawline)\n⎸𝔟𝖆𝖘𝔥 ⎸$(hostname) ⎸📆  $(get_time) ⎸ 📂  $(pwd) $(get_branch)\n\[\e[0m\]\[\e[36m\]\[\e[35m\]⢈\[\e[31m\]⢨⢘\[\e[91m\]⢈⢸⠨\[\e[33m\]⠸⢈\[\e[32m\]⢨\[\e[36m\]⢘\[\e[94m\]⢈ \[\e[37m\]$\[\e[0m\] ';

bind '"\e[1;5D" backward-word'; 
bind '"\e[1;5C" forward-word';
