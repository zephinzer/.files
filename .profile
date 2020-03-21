## initialise with message
printf -- "\033[90m";
#  ___   _  _____  _  _  ___ 
# | _ \ /_\|_   _|| || |/ __|
# |  _// _ \ | |  | __ |\__ \
# |_| /_/ \_\|_|  |_||_||___/
#                            
export PATH="${PATH}:/=/:/bin:/usr/bin:usr/local/bin";
# personal whims
[ -e "/opt/tools" ] && export PATH="${PATH}:/opt/tools";
[ -e "/opt/tools/bin" ] && export PATH="${PATH}:/opt/tools/bin";
[ -e "${HOME}/.bin" ] && export PATH="${PATH}:${HOME}/.bin";
[ -e "${HOME}/.local/bin" ] && export PATH="${PATH}:${HOME}/.local/bin";
[ -e "${HOME}/scripts" ] && export PATH="${PATH}:${HOME}/scripts";
# ruby environment manager
[ -e "${HOME}/.rbenv/bin" ] && export PATH="${PATH}:${HOME}/.rbenv/bin";
# rust
[ -e "${HOME}/.cargo/bin" ] && export PATH="${PATH}:${HOME}/.cargo/bin";
# linkerd
[ -e "${HOME}/.linkerd2/bin" ] && export PATH="${PATH}:${HOME}/.linkerd2/bin";
printf -- "PATH-${PATH}.";
#    _   _    ___   _   ___ ___ ___ 
#   /_\ | |  |_ _| /_\ / __| __/ __|
#  / _ \| |__ | | / _ \\__ \ _|\__ \
# /_/ \_\____|___/_/ \_\___/___|___/
#                                   
[ -e "${HOME}/.aliases" ] && source "${HOME}/.aliases";
#  ___ ___ ___ ___ _  ___   __
#  |   \_ _| _ \ __| \| \ \ / /
#  | |) | ||   / _|| .` |\ V / 
#  |___/___|_|_\___|_|\_| \_/  
#                                  
which direnv >/dev/null && eval "$(direnv hook bash)";
#  _  _ __   __ __  __ 
# | \| |\ \ / /|  \/  |
# | .` | \ V / | |\/| |
# |_|\_|  \_/  |_|  |_|
#                      
[ -e "${HOME}/.nvm" ] && export NVM_DIR="${HOME}/.nvm";
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh";
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion";
#  ___  ___  ___  _  _ __   __
# | _ \| _ )| __|| \| |\ \ / /
# |   /| _ \| _| | .` | \ V / 
# |_|_\|___/|___||_|\_|  \_/  
#
which rbenv >/dev/null && eval "$(rbenv init -)";
#  _  _______   _____ _  _   _   ___ _  _ 
# | |/ / __\ \ / / __| || | /_\ |_ _| \| |
# | ' <| _| \ V / (__| __ |/ _ \ | || .` |
# |_|\_\___| |_| \___|_||_/_/ \_\___|_|\_|
#                  
if tty -s; then
  which keychain &>/dev/null \
    && eval `keychain --eval --agents ssh ~/.ssh/id_rsa_*` \
    && source ${HOME}/.keychain/$(hostname)-sh \
    || eval `ssh-agent -s`;
fi;
#   ___   ___  ___ 
#  / __| / __|| _ \
# | (_ || (__ |  _/
#  \___| \___||_|  
#                  
[ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ] && source "${HOME}/google-cloud-sdk/path.zsh.inc";
[ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ] && source "${HOME}/google-cloud-sdk/completion.zsh.inc";
#  ___  ___  __  __ ___   _  _   _   ___ _  __
# / __|/ _ \|  \/  | __| | || | /_\ / __| |/ /
# \__ \ (_) | |\/| | _|  | __ |/ _ \ (__| ' < 
# |___/\___/|_|  |_|___| |_||_/_/ \_\___|_|\_\
#                                             
[ -n $TERM ] \
  && sleep 1 \
  && command -v tput &>/dev/null && tput -Txterm reset;
#  _  _ ___ ___ ___ 
# | \| |_ _/ __| __|
# | .` || | (__| _| 
# |_|\_|___\___|___|
#                   
printf -- '\033[1m';
if [ -n $TERM ]; then
  printf -- '\033[37m\033[4m%*s\033[0m\n' "${COLUMNS:-$(tput -Txterm cols)}" '' | tr ' ' ' ';
fi;
printf -- '\033[31m     ___ __        \033[0m\033[90mBE RELENTLESS\033[0m\033[1m   \n';
printf -- '\033[31m   _{___{__}\\        \033[0m\033[34mBE DISCIPLINED\033[0m\033[1m  \n';
printf -- '\033[91m  {_}      \`\\)        \033[0m\033[31mBE PASSIONATE\033[0m\033[1m \n';
printf -- '\033[91m {_}        `            _.-````--.._     \n';
printf -- '\033[33m {_}                    //`.--.  \\___`.  \n';
printf -- '\033[33m  { }__,_.--~~~-~~~-~~-::.---. `-.\\  `.) \n';
printf -- '\033[32m   `-.{_{_{_{_{_{_{_{_//  -- 8;=- `       \n';
printf -- '\033[32m      `-:,_.:,_:,_:,.`\\\\._ ..`=- ,  \e[0m\e[31m🅙 \e[91m🅞 \e[33m🅔 \e[36m🅘 \e[94m🅡⢀\e[37m🅝 🅔 🅣 \e[0m  \n';
printf -- '\033[36m          // // // //`-.`\`   .-`/        \n';
printf -- '\033[94m         << << << <<    \\ `--`  /----)   \n';
printf -- '\033[94m          ^  ^  ^  ^     `-.....--```     ';
printf -- '\033[0m';
