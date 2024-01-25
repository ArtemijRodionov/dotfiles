#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/Cellar/watson/1.5.2_1/etc/bash_completion.d/watson


DRONE_TOKEN=$(security find-generic-password -a ${USER} -s drone_token -w)

function docker-stop() { docker stop $(docker ps -aq); }
function docker-rm() { docker rm $(docker ps -aq); }
function docker-rmi-dangling() { docker rmi -f $(docker images --filter "dangling=true" -q); }
function drone() { docker run --rm -it -e DRONE_SERVER=https://ci.fidals.com -e DRONE_TOKEN=$DRONE_TOKEN drone/cli:0.8 "$@"; }
function mov2gif { ffmpeg -i $1 -threads 0 -filter_complex "[0:v] fps=12" -f gif $2; }


export EDITOR="vim"

alias grep="grep --color=always"
alias diff="diff \
    --old-group-format=$'\e[0;31m%<\e[0m' \
    --new-group-format=$'\e[0;31m%>\e[0m' \
    --unchanged-group-format=$'\e[0;32m%=\e[0m'"

source $HOME/.cargo/env

export PATH="/usr/local/sbin:$PATH:$HOME/Library/Python/3.7/bin:$HOME/.poetry/bin:$HOME/Library/Python/2.7/bin:$HOME/Workflow/arc/bin:$HOME/.emacs.d/bin"


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
