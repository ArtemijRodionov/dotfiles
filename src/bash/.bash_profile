[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/Cellar/watson/1.5.2_1/etc/bash_completion.d/watson


DRONE_TOKEN=$(security find-generic-password -a ${USER} -s drone_token -w)

function docker-stop() { docker stop $(docker ps -aq); }
function docker-rm() { docker rm $(docker ps -aq); }
function docker-rmi-dangling() { docker rmi -f $(docker images --filter "dangling=true" -q); }
function drone() { docker run --rm -it -e DRONE_SERVER=https://ci.fidals.com -e DRONE_TOKEN=$DRONE_TOKEN drone/cli "$@"; }

export EDITOR="vim"

