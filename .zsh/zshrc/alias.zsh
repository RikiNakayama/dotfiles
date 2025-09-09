##################
# alias settings #
##################
setopt complete_aliases

alias sudo="sudo "

alias where="command -v"
alias jobs="jobs -l"
alias j="jobs"

# ls
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w -F" ;;
linux*)
    alias ls="ls --color -F" ;;
esac

alias la="ls -a"
alias ll="ls -l"

alias mkdir="mkdir -p"
alias mv="mv -i"

alias rm="rm -r"
alias rr="rm -rf"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias pd="popd"

alias diff="diff \
    --ignore-space-change \
    --ignore-tab-expansion \
    --ignore-blank-lines \
    --strip-trailing-cr \
    --suppress-common-lines \
    --recursive"

alias tree="tree -C"
