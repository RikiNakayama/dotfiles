##################
# basic settings #
##################

# LANG
export LANG=ja_JP.UTF-8

# auto cd
setopt auto_cd

# get stacked-dir by cd -[tab]
setopt auto_pushd

# もしかして!?
setopt correct

# コンパクトに補完リスト表示
setopt list_packed

# パス補完時に/つける
setopt noautoremoveslash

# no beep sound
setopt nolistbeep

# エイリアスでも補完
setopt complete_aliases

# key bind
bindkey -v

# zsh editor
autoload zed

# =の後でもファイル名展開
setopt magic_equal_subst

# 拡張glob
setopt extended_glob
setopt mark_dirs

# jobs -l
setopt long_list_jobs

# 実行したプロセスの消費時間が特定秒数かかったら自動的に統計情報表示
REPORTTIME=3

# 全てのユーザのlogin,logoutを監視
watch="all"

# ログアウト時に、バックグランドジョブをハングアップしない
setopt no_hup

# バックグランドジョブが終了したら、プロンプトを待たずに知らせる
setopt notify
