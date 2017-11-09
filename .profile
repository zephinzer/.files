clear;
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# eval "$(rbenv init -)";
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

if [[ "$SSH_AUTH_SOCK" != '' ]]; then
  eval `ssh-agent -s` &>/dev/null;
  ls -A ~/.ssh | egrep '^id_rsa[0-9a-zA-Z_]+$' | xargs -I@ bash -c "ssh-add ~/.ssh/@" &>/dev/null;
fi;

alias ga='git add';
alias gaaa='git add .';
alias gb='git branch -ar';
alias gcm='git commit -m';
alias gcmae='git commit --allow-empty -m';
alias gcb="git name-rev --name-only HEAD";
alias gco='git checkout';
alias gcr="git config branch.$(gcb).remote";
alias gf='git fetch';
alias grb='git rebase';
alias grm='git remote';
alias gs='git status';
alias gpullcb='git pull ${gcr} $(gcb)';
alias gpushcb='git push ${gcr} $(gcb)';
alias gpullrecb='git pull --rebase ${gcr} $(gcb)';
alias ll='ls -lA';
alias kc='kubectl';
alias kca='kubectl apply -f';
alias kcc='kubectl create';
alias kcd='kubectl describe';
alias kcdp='kubectl describe pod';
alias kcdn='kubectl describe node';
alias kcdd='kubectl describe deployment';
alias kcds='kubectl describe service';
alias kcdsec='kubectl describe sercret';
alias kcdi='kubectl describe ing';
alias kcdcm='kubectl describe cm';
alias kcdel='kubectl delete';
alias kcexec='kubectl exec';
alias kcg='kubectl get';
alias kcgp='kubectl get pods -o wide';
alias kcgn='kubectl get nodes -o wide';
alias kcgep='kubectl get ep -o wide';
alias kcgd='kubectl get deploy -o wide';
alias kcgs='kubectl get svc -o wide';
alias kcgsec='kubectl get secrets -o wide';
alias kcgi='kubectl get ing -o wide';
alias kcgcm='kubectl get cm -o wide';
alias kcl='kubectl logs';
alias kclf='kubectl logs -f';
alias kcr='kubectl replace';
alias gc='gcloud';
alias gce='gcloud compute';
alias gceals='gcloud compute addresses list'
alias gke='gcloud container';
alias gkeils='gcloud container image list --repository'
alias gkeitls='gcloud container image list-tags'
alias gcdpush='gcloud docker -- push';
alias gcdpull='gcloud docker -- pull';
printf "\e[35m――――――――――――――――――――――――――――――――――――――――――――――――――――\e[0m\n";
printf "\e[31m⎸⍽֯⍽֯⍽                      ⚬     ֯       ֯          ֯⍽⍽֯⍽⎸✅  BE AWESOME\n";
printf "\e[91m⎸⍽⍽⍽ ⎽⎽⎽⎽⎽⎽⎽֯⎽ ⎽ ⎽⎽ ⎾ ֯⏋⎽⎽ ⎹⎽⎸⎽ ⎽⎽  ⎽⎽⎽⎽⎽⎽⎽⎽ ⎽ ⎽⎽  ⍽֯⍽⍽֯⎸✅  BE RELENTLESS\n";
printf "\e[33m⎸֯⍽֯⍽⍽⎹⎽⎽  ⧸ ⎽ | '⎽ \│ '֯⎽ \⎹ ⎸ '֯⎽ \⎹⎽⎽⎽ / ⎽ ⎸ '⎽⎽⎸ ֯⍽⍽֯⍽֯⎸✅  BE DISCIPLINED\n";
printf "\e[32m⎸⍽⍽⍽  ⧸ |  ⎽⎽| |⎽) │ | |⎹⎹ ⎸ | | | ⧸ |  ⎽⎽⎸ ⎸    ⍽֯⍽⍽֯⎸✅  BE COMPASSIONATE\n";
printf "\e[36m⎸֯⍽֯⍽֯⍽ ⧸⎽⎽⎽⧹⎽⎽⎽| .⎽⎽/|⎽| |⎽⎹⎽⎸⎽| |⎽|⧸⎽⎽⎽⧹⎽⎽⎽⎸⎽⎸    ֯⍽⍽֯⍽֯⎸✅  BE PASSIONATE\n";
printf "\e[94m⎸⍽⍽֯⍽֯     ֯  ֯ ֯ |⎽|        ֯ ֯  ֯   \e[31m🅙 \e[91m🅞 \e[33m🅔 \e[36m🅘 \e[94m🅡 ⢀\e[37m🅝 🅔 🅣 \e[34m  ⍽֯⍽⍽֯⎸✅  \e[47m\e[34mBE YOURSELF\e[0m\n";
printf "\e[34m――――――――――――――――――――――――――――――――――――――――――――――――――――\e[0m\n";

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/Users/$(whoami)/google-cloud-sdk/path.zsh.inc" ]; then source "/Users/$(whoami)/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/$(whoami)/google-cloud-sdk/completion.zsh.inc" ]; then source "/Users/$(whoami)/google-cloud-sdk/completion.zsh.inc"; fi
