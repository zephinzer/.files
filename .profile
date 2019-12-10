## initialise with message
printf -- "\033[90m.PROFILE.";

#  ___   _  _____  _  _  ___ 
# | _ \ /_\|_   _|| || |/ __|
# |  _// _ \ | |  | __ |\__ \
# |_| /_/ \_\|_|  |_||_||___/
#                            

export PATH="${PATH}:/=/:/bin:/usr/bin:usr/local/bin";
export PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/2.7/bin";
export PATH="${PATH}:/usr/local/lib/python2.7/site-packages";
export PATH="${PATH}:/usr/local/mysql/bin";
export PATH="${PATH}:/usr/local/sbin";
export PATH="${PATH}:/opt/tools";
export PATH="${PATH}:/opt/tools/bin";
export PATH="${PATH}:${HOME}/.bin";
export PATH="${PATH}:${HOME}/.composer/vendor/bin";
export PATH="${PATH}:${HOME}/scripts";
# ruby environment manager
[ -e "${HOME}/.rbenv/bin" ] && export PATH="${PATH}:${HOME}/.rbenv/bin";
# rust
[ -e "${HOME}/.cargo/bin" ] && export PATH="${PATH}:${HOME}/.cargo/bin";
# linkerd
[ -e "${HOME}/.linkerd2/bin" ] && export PATH="${PATH}:${HOME}/.linkerd2/bin";
printf -- "PATH-${PATH}."


#  ___ ___ ___ ___ _  ___   __
#  |   \_ _| _ \ __| \| \ \ / /
#  | |) | ||   / _|| .` |\ V / 
#  |___/___|_|_\___|_|\_| \_/  
#                                  

which direnv >/dev/null;
if [ "$?" = "0" ]; then
  eval "$(direnv hook bash)";
fi;

#    _   _    ___   _   ___ ___ ___ 
#   /_\ | |  |_ _| /_\ / __| __/ __|
#  / _ \| |__ | | / _ \\__ \ _|\__ \
# /_/ \_\____|___/_/ \_\___/___|___/
#                                   

printf -- 'ALIASES-';
_=$(stat "${HOME}/.aliases" &>/dev/null);
if [ "$?" = "0" ]; then
  source "${HOME}/.aliases";
  printf -- 'Y.';
else printf -- 'N.';
fi;

#  _  _ __   __ __  __ 
# | \| |\ \ / /|  \/  |
# | .` | \ V / | |\/| |
# |_|\_|  \_/  |_|  |_|
#                      

NVM_PRESENT=0;
stat "${HOME}/.nvm" &>/dev/null && NVM_PRESENT=1;
printf -- 'NVM-';
if [ ${NVM_PRESENT} -eq 1 ]; then
  export NVM_DIR="${HOME}/.nvm";
  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh";
  [ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion";
  printf -- 'Y.';
else printf -- 'N.';
fi;

#  ___  ___  ___  _  _ __   __
# | _ \| _ )| __|| \| |\ \ / /
# |   /| _ \| _| | .` | \ V / 
# |_|_\|___/|___||_|\_|  \_/  
#

RBENV_PRESENT=0;
_=$(which rbenv &>/dev/null);
if [ "$?" = "0" ]; then RBENV_PRESENT=1; fi;
printf -- 'RBENV-';
if [ ${RBENV_PRESENT} -eq 1 ]; then
  eval "$(rbenv init -)";
  printf -- 'Y.';
else printf -- 'N.';
fi;

#  _  _______   _____ _  _   _   ___ _  _ 
# | |/ / __\ \ / / __| || | /_\ |_ _| \| |
# | ' <| _| \ V / (__| __ |/ _ \ | || .` |
# |_|\_\___| |_| \___|_||_/_/ \_\___|_|\_|
#                                         

printf -- 'KEYCHAIN-';
KEYCHAIN_PRESENT=0;
which keychain &>/dev/null && KEYCHAIN_PRESENT=1;
if [ ${KEYCHAIN_PRESENT} -eq 1 ]; then
  # add all SSH keys with 'id_rsa' in their name
  ls ~/.ssh | grep id_rsa | grep -v '.pub' | xargs -I@ keychain -- ~/.ssh/@;
  # initialise keychain
  source ~/.keychain/$(hostname)-sh;
  printf -- 'Y.';
else
  printf -- 'N,';

  #  ___  ___  _  _     _    ___  ___  _  _  _____ 
  # / __|/ __|| || |   /_\  / __|| __|| \| ||_   _|
  # \__ \\__ \| __ |  / _ \| (_ || _| | .` |  | |  
  # |___/|___/|_||_| /_/ \_\\___||___||_|\_|  |_|  
  #                                                
  # only executes if keychain is not present
  printf -- 'SSHAGENT-';
  if [ "${SSH_AUTH_SOCK}" != '' ]; then
    # eval `ssh-agent -s`;
    printf -- 'Y.';
  else
    printf -- 'N.';
  fi; 
fi;

#   ___   ___  ___ 
#  / __| / __|| _ \
# | (_ || (__ |  _/
#  \___| \___||_|  
#                  

if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

#  ___  ___  __  __ ___   _  _   _   ___ _  __
# / __|/ _ \|  \/  | __| | || | /_\ / __| |/ /
# \__ \ (_) | |\/| | _|  | __ |/ _ \ (__| ' < 
# |___/\___/|_|  |_|___| |_||_/_/ \_\___|_|\_\
#                                             

printf -- '\n';
if [ -n $TERM ]; then
  sleep 1;
  command -v tput &>/dev/null && tput -Txterm reset;
fi;

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
