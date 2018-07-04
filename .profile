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
export PATH="${PATH}:/usr/local/go/bin";
export PATH="${PATH}:/usr/local/sbin";
export PATH="${PATH}:/opt/tools";
export PATH="${PATH}:/opt/tools/bin";
export PATH="${PATH}:/${HOME}/.bin";
export PATH="${PATH}:/${HOME}/.cargo/bin";
export PATH="${PATH}:/${HOME}/.composer/vendor/bin";
export PATH="${PATH}:/${HOME}/.rbenv/bin";
export PATH="${PATH}:/${HOME}/scripts";
export PATH="${PATH}:${PWD}/node_modules/.bin";
printf -- "PATH-${PATH}."

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

_=$(which rbenv &>/dev/null);
if [ "$?" = "0" ]; then RBENV_PRESENT=1;
else RBENV_PRESENT=0; fi;
printf -- 'RBENV-';
if [ $RBENV_PRESENT -eq 1 ]; then
  eval "$(rbenv init -)";
  printf -- 'Y.';
else printf -- 'N.';
fi;

#  ___  ___  _  _     _    ___  ___  _  _  _____ 
# / __|/ __|| || |   /_\  / __|| __|| \| ||_   _|
# \__ \\__ \| __ |  / _ \| (_ || _| | .` |  | |  
# |___/|___/|_||_| /_/ \_\\___||___||_|\_|  |_|  
#                                                

printf -- 'SSHAGENT-';
if [ "${SSH_AUTH_SOCK}" != '' ]; then
  eval `ssh-agent -s` &>/dev/null;
  ls -A "${HOME}/.ssh" | egrep '^[a-z]+_rsa[0-9a-zA-Z_]+$' | xargs -I@ sh -c "ssh-add ${HOME}/.ssh/@";
  printf -- 'Y.';
else
  printf -- 'N.';
fi;

#   ___   ___  ___ 
#  / __| / __|| _ \
# | (_ || (__ |  _/
#  \___| \___||_|  
#                  

if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

printf -- 'ALIASES-';
_=$(stat "${HOME}/.aliases" &>/dev/null);
if [ "$?" = "0" ]; then
  source "${HOME}/.aliases";
  printf -- 'Y.';
else printf -- 'N.';
fi;

## a linux hack because this
printf -- '\n';
if [ -n $TERM ]; then
  command -v tput &>/dev/null && tput -Txterm reset;
fi;

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
