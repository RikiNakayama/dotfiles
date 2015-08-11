"---------------------------------------------------------------------------------
" Basics
"---------------------------------------------------------------------------------
set nocompatible
let mapleader = ","							" キーマップリーダー
set scrolloff=5									" スクロール時の余白
set textwidth=0									" 自動折り返し
set nowrap											" 自動折り返し無効
set nobackup										" バックアップ無効
set autoread										" 書き換えられたら再読込
set noswapfile									" スワップファイル作らない
set hidden											" 編集中でも開ける
set backspace=indent,eol,start	" バックスペースで削除する文字
set formatoptions=lmoq					" テキスト整形オプション、マルチバイト系を追加
set vb t_vb=										" ビープ音無効
"set browsedir=buffer						" Exploreの初期ディレクトリ
"set whichwrap=b,s,h,l,<,>,[,]	" カーソルを行頭、行末で止まらないようにする
set showcmd											" コマンドをステータス行に表示
set showmode										" 現在のモードを表示
"set viminfo='50,<1000,s100,\"50	" viminfoファイルの設定
"set modelines=0								" モードライン無効

if has('clipboard')
	"クリップボード共有
	set clipboard=unnamed,autoselect
	" 挿入モード<C-k>でクリップボードを貼りつけ
	imap <C-k> <Esc>"*pa
endif

" Ev/Rvでvimrcの編集と反映
" command! Ev edit $MYVIMRC
" command! Rv source $MYVIMRC

" ターミナルでマウスを使用
set mouse=a
set guioptions+=a
set ttymouse=xterm2

set helpfile=$VIMRUNTIME/doc/help.txt
filetype plugin on
