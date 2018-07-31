[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/Cellar/watson/1.5.2_1/etc/bash_completion.d/watson
export EDITOR="emacs -nw

function docker-stop() { docker stop $(docker ps -aq); }
function docker-rm() { docker rm $(docker ps -aq); }
function docker-rmi-dangling() { docker rmi -f $(docker images --filter "dangling=true" -q); }
