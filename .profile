clear;
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# eval "$(rbenv init -)";
export PATH="/=/usr/local/bin:/usr/local/mysql/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/lib/python2.7/site-packages:/$HOME/scripts:/$HOME/.composer/vendor/bin:/usr/local/sbin:$HOME/.rbenv/bin:$HOME/.cargo/bin:$PATH"
if [[ "$SSH_AUTH_SOCK" != '' ]]; then
  eval `ssh-agent -s` &>/dev/null;
  ls -A ~/.ssh | egrep '^id_rsa[0-9a-zA-Z_]+$' | xargs -I@ bash -c "ssh-add ~/.ssh/@" &>/dev/null;
fi;
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
alias kcexec='kubectl exec';
alias kcr='kubectl replace';
alias gc='gcloud';
alias gce='gcloud compute';
alias gke='gcloud container';
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
if [ -f '/Users/zephinzer/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/zephinzer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zephinzer/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/zephinzer/google-cloud-sdk/completion.zsh.inc'; fi
