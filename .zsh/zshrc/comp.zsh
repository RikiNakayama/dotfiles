#######################
# completion settings #
#######################
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' menu select=1

zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _prefix
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

## カーソル位置で補完する。
setopt complete_in_word
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort


# git補完
autoload -U bashcompinit
bashcompinit
source ~/.zsh/modules/git-completion.bash
