## initialise with message
printf -- "> initialising .profile...\n";

## node version manager initialisation
_=$(command -v nvm);
if [ "$?" = "0" ]; then NVM_PRESENT=1;
else NVM_PRESENT=0; fi;
printf -- "NVM_PRESENT: ${NVM_PRESENT}\n";

if [ $NVM_PRESENT - eq 1 ]; then
  export NVM_DIR="${HOME}/.nvm";
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh";
fi;

## ruby env initialisation
_=$(which rbenv &>/dev/null);
if [ "$?" = "0" ]; then RBENV_PRESENT=1;
else RBENV_PRESENT=0; fi;
printf -- "RBENV_PRESENT: ${RBENV_PRESENT}\n";

if [ $RBENV_PRESENT -eq 1 ]; then
  eval "$(rbenv init -)";
fi;

export PATH="\
/=/usr/local/bin:\
/Library/Frameworks/Python.framework/Versions/2.7/bin:\
$PWD/node_modules/.bin:\
/usr/local/mysql/bin:\
/usr/local/go/bin:\
/usr/local/sbin:\
/usr/local/lib/python2.7/site-packages:\
/$HOME/.bin:\
/$HOME/.cargo/bin:\
/$HOME/.composer/vendor/bin:\
/$HOME/.rbenv/bin:\
/$HOME/scripts:\
$PATH"

## initialise ssh agent if SSH_AUTH_SOCK is found

if [[ "$SSH_AUTH_SOCK" != '' ]]; then
  printf -- '> ssh-agent found, initialising ssh keys...\n';
  eval `ssh-agent -s` &>/dev/null;
  ls -A "${HOME}/.ssh" | egrep '^id_rsa[0-9a-zA-Z_]+$' | xargs -I@ sh -c "ssh-add ${HOME}/.ssh/@";
else
  printf -- '> ssh-agent not found - skipping\n';
fi;

source ~/.aliases;

_=$(command -v tput);
if [ "$?" = "0" ]; then
 tput reset;
fi;

printf '\e[31m⎸                     .__    .__           \e[0m\e[31m🅙 \e[91m🅞 \e[33m🅔 \e[36m🅘 \e[94m🅡 ⢀\e[37m🅝 🅔 🅣 \e[0m ⎸✅  BE AWESOME\n';
printf '\e[91m⎸________ ____ ______ |  |__ |__| ____ ________ ___________  ⎸✅  BE RELENTLESS\n';
printf '\e[33m⎸\___   // __ \\\____ \|  |  \|  |/    \\\___   // __ \_  __ \ ⎸✅  BE DISCIPLINED\n';
printf '\e[32m⎸ /    /\  ___/|  |_> >   Y  \  |   |  \/    /\  ___/|  | \/ ⎸✅  BE COMPASSIONATE\n';
printf '\e[36m⎸/_____ \\\___  >   __/|___|  /__|___|  /_____ \\\___  >__|    ⎸✅  BE PASSIONATE\n';
printf '\e[94m⎸      \/    \/|__|        \/        \/      \/    \/        ⎸✅  \e[47m\e[34mBE YOURSELF\e[0m\n';

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/Users/$(whoami)/google-cloud-sdk/path.zsh.inc" ]; then source "/Users/$(whoami)/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/$(whoami)/google-cloud-sdk/completion.zsh.inc" ]; then source "/Users/$(whoami)/google-cloud-sdk/completion.zsh.inc"; fi
