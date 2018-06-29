if which go > /dev/null; then
  export PATH="$HOME/.goenv/shims:$PATH"
  export PATH="$HOME/.go/bin:$PATH"
  export GOPATH="$HOME/.go"
  eval "$(goenv init -)"
fi
