clear;
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# eval "$(rbenv init -)";
export PATH="/=/usr/local/bin:/usr/local/mysql/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/lib/python2.7/site-packages:/$HOME/scripts:/$HOME/.composer/vendor/bin:/usr/local/sbin:$HOME/.rbenv/bin:$HOME/.cargo/bin:$PATH"
if [[ "$SSH_AUTH_SOCK" != '' ]]; then
  eval `ssh-agent -s` &>/dev/null;
  ls -A ~/.ssh | egrep '^id_rsa[0-9a-zA-Z_]+$' | xargs -I@ bash -c "ssh-add ~/.ssh/@" &>/dev/null;
fi;
printf "\e[35m――――――――――――――――――――――――――――――――――――――――――――――――――――\e[0m\n";
printf "\e[31m⎸⍽֯⍽֯⍽                      ⚬     ֯       ֯          ֯⍽⍽֯⍽⎸✅  BE AWESOME\n";
printf "\e[91m⎸⍽⍽⍽ ⎽⎽⎽⎽⎽⎽⎽֯⎽ ⎽ ⎽⎽ ⎾ ֯⏋⎽⎽ ⎹⎽⎸⎽ ⎽⎽  ⎽⎽⎽⎽⎽⎽⎽⎽ ⎽ ⎽⎽  ⍽֯⍽⍽֯⎸✅  BE RELENTLESS\n";
printf "\e[33m⎸֯⍽֯⍽⍽⎹⎽⎽  ⧸ ⎽ | '⎽ \│ '֯⎽ \⎹ ⎸ '֯⎽ \⎹⎽⎽⎽ / ⎽ ⎸ '⎽⎽⎸ ֯⍽⍽֯⍽֯⎸✅  BE DISCIPLINED\n";
printf "\e[32m⎸⍽⍽⍽  ⧸ |  ⎽⎽| |⎽) │ | |⎹⎹ ⎸ | | | ⧸ |  ⎽⎽⎸ ⎸    ⍽֯⍽⍽֯⎸✅  BE COMPASSIONATE\n";
printf "\e[36m⎸֯⍽֯⍽֯⍽ ⧸⎽⎽⎽⧹⎽⎽⎽| .⎽⎽/|⎽| |⎽⎹⎽⎸⎽| |⎽|⧸⎽⎽⎽⧹⎽⎽⎽⎸⎽⎸    ֯⍽⍽֯⍽֯⎸✅  BE PASSIONATE\n";
printf "\e[94m⎸⍽⍽֯⍽֯     ֯  ֯ ֯ |⎽|        ֯ ֯  ֯   \e[31m🅙 \e[91m🅞 \e[33m🅔 \e[36m🅘 \e[94m🅡 ⢀\e[37m🅝 🅔 🅣 \e[34m  ⍽֯⍽⍽֯⎸✅  \e[47m\e[34mBE YOURSELF\e[0m\n";
printf "\e[34m――――――――――――――――――――――――――――――――――――――――――――――――――――\e[0m\n";
