printf -- "> initialising .profile...\n";
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export PATH="\
/=/usr/local/bin:\
/Library/Frameworks/Python.framework/Versions/2.7/bin:\
/usr/local/mysql/bin:\
/usr/local/sbin:\
/usr/local/lib/python2.7/site-packages:\
/$HOME/.bin:\
/$HOME/.cargo/bin:\
/$HOME/.composer/vendor/bin:\
/$HOME/.rbenv/bin:\
/$HOME/scripts:\
$PATH"

## initialise ruby environment if available

_=$(which rbenv &>/dev/null);
if [ "$?" = "0" ]; then
  printf -- '> rbenv found on this system - initialising\n';
  eval "$(rbenv init -)";
else
  printf -- '> rbenv is not present on this system - skipping\n';
fi

## initialise ssh agent if SSH_AUTH_SOCK is found

if [[ "$SSH_AUTH_SOCK" != '' ]]; then
  printf -- '> ssh-agent found, initialising ssh keys...\n';
  eval `ssh-agent -s` &>/dev/null;
  ls -A "${HOME}/.ssh" | egrep '^id_rsa[0-9a-zA-Z_]+$' | xargs -I@ sh -c "ssh-add ${HOME}/.ssh/@";
else
  printf -- '> ssh-agent not found - skipping\n';
fi;

alias ll='ls -lA';

# > docker
alias dk='docker';
alias dkc='docker-compose';
alias dkb='docker build';
alias dksvc='docker service';
alias dksvcl='docker service logs';
alias dks='docker stack';
alias dkssvc='docker stack service';
alias dksd='docker stack deploy';
alias dkr='docker run';
alias dkb='docker build';
alias dkl='docker login';
alias dkpush='docker push';
alias dkpull='docker pull';
alias dkps='docker ps';
alias dkcon='docker container';
alias dkimg='docker image';
# / docker

# > git
alias ga='git add';
alias gcb='printf %s "$(git branch | grep "*" | cut -f 2 -d " ")"';
alias gcm='git commit -m';
alias gcmae='git commit --allow-empty -m';
alias gco='git checkout';
alias gcob='gco -b';
alias gf='git fetch';
alias gi='git init';
alias gl='git log';
alias gln='git log -n';
alias gplrecb='git pull --rebase origin $(gcb)';
alias gplcb='git pull origin $(gcb)';
alias gpscb='git push origin $(gcb)';
alias gr='git rebase';
alias gri='git rebase -i HEAD~';
alias gs='git status';
# / git

# > kubectl
alias kc='kubectl';
alias kca='kubectl apply -f';
alias kccv='kubectl config view';
alias kcd='kubectl describe';
alias kcdcm='kubectl describe configmap';
alias kcdd='kubectl describe deployment';
alias kcdp='kubectl describe pod';
alias kcdpv='kubectl describe persistentvolume';
alias kcdpvc='kubectl describe persistentvolumeclaim';
alias kcdn='kubectl describe node';
alias kcdsec='kubectl describe secret';
alias kcds='kubectl describe service';
alias kcdi='kubectl describe ingress';
alias kcdcm='kubectl describe configmap';
alias kcdel='kubectl delete';
alias kcdelcm='kubectl delete configmap';
alias kcdeld='kubectl delete deployment';
alias kcdelp='kubectl delete pod';
alias kcdelpv='kubectl delete persistentvolume';
alias kcdelpvc='kubectl delete persistentvolumeclaim';
alias kcdelsec='kubectl delete secret';
alias kcdels='kubectl delete service';
alias kcdeli='kubectl delete ingress';
alias kcg='kubectl get';
alias kcgp='kubectl get pods -o wide';
alias kcgpv='kubectl get persistentvolume -o wide';
alias kcgpvc='kubectl get persistentvolumeclaim -o wide';
alias kcgn='kubectl get nodes -o wide';
alias kcgep='kubectl get ep -o wide';
alias kcgd='kubectl get deploy -o wide';
alias kcgs='kubectl get service -o wide';
alias kcgsec='kubectl get secrets -o wide';
alias kcgi='kubectl get ing -o wide';
alias kcgcm='kubectl get configmap -o wide';
alias kcl='kubectl logs';
alias kclf='kubectl logs -f';
alias kcexec='kubectl exec';
# / kubectl

# > gcloud
alias gcl='gcloud';
alias gcle='gcloud compute';
alias gcleals='gcloud compute addresses list'
alias gcldkpush='gcloud docker -- push';
alias gcldkpull='gcloud docker -- pull';
# / gcloud

# > gcloud gke
alias gke='gcloud container';
alias gkeils='gcloud container image list --repository'
alias gkeitls='gcloud container image list-tags'
# / gcloud gke

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
