set -o vi
bind '"\C-g":vi-movement-mode'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

DRONE_TOKEN=$(security find-generic-password -a ${USER} -s drone_token -w)

function docker-stop() { docker stop $(docker ps -aq); }
function docker-rm() { docker rm $(docker ps -aq); }
function docker-rmi-dangling() { docker rmi -f $(docker images --filter "dangling=true" -q); }
function drone() { docker run --rm -it -e DRONE_SERVER=https://ci.fidals.com -e DRONE_TOKEN=$DRONE_TOKEN drone/cli:0.8 "$@"; }
function mov2gif { ffmpeg -i $1 -threads 0 -filter_complex "[0:v] fps=12,scale=${3:-960}:-1" $2; }

export EDITOR="vim"

alias grep="grep --color=always"
alias diff="diff \
    --old-group-format=$'\e[0;31m%<\e[0m' \
    --new-group-format=$'\e[0;31m%>\e[0m' \
    --unchanged-group-format=$'\e[0;32m%=\e[0m'"

source $HOME/.cargo/env
export GOPATH=$HOME/Workflow/projects/Go
export PATH="/usr/local/sbin:$PATH:/Users/artemiy/Library/Python/3.7/bin:$HOME/.poetry/bin"

