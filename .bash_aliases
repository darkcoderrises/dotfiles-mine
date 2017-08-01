alias matlab="/usr/local/MATLAB/MATLAB_Production_Server/R2015a/bin/matlab -nodisplay -nojvm";
alias dairy="touch dairy.`date +%Y-%m-%d`"

export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/mnt/harshil/harshil/Apps/jdk1.8.0_121/bin:/mnt/harshil/harshil/Apps/node-v6.9.4-linux-x64/bin

alias assh='autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3"'

alias tmux='tmux -u'
alias batter="while true : ; do echo -ne "$(acpi) \r"; done"
