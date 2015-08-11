"---------------------------------------------------------------------------------
" Apperance
"---------------------------------------------------------------------------------
set showmatch	" 対応括弧のハイライト
set number		" 行番号
set list
" set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set display=uhex " 印字不可能文字を16進数表示
syntax enable	" シンタックスハイライト

set backupskip=/tmp/*,/private/tmp/*

" ターミナルタイプによるカラー設定
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" " || &term =~ "xterm-256color"
 set t_Co=16
 " set t_Sf=[3%dm
 " set t_Sf=[3%dm
 set t_Sf=[3%dm
 set t_Sb=[4%dm
elseif &term =~ "xterm-color"
 set t_Co=8
 " set t_Sf=[3%dm
 " set t_Sb=[4%dm
 set t_Sf=[3%dm
 set t_Sb=[4%dm
else
 set t_Co=256
 " set t_Sf=[3%dm
 " set t_Sb=[4%dm
 set t_Sf=[3%dm
 set t_Sb=[4%dm
endif

" カラースキーマ
" set background=dark
if has('gui_running')
	" autocmd GUIEnter * colorscheme solarized
	autocmd GUIEnter * colorscheme zenburn
	set iminsert=0 imsearch=0
else
	" colorscheme solarized
	colorscheme zenburn
	" hi Normal ctermbg=NONE
endif

if has('kaoriya')
	" 半透明処理
	" set transparency=20
	autocmd GUIEnter * set transparency=20
endif

" 補完候補の色づけ for vim7
hi Pmenu ctermbg=white ctermfg=darkgray
hi PmenuSel ctermbg=blue ctermfg=white
hi PmenuSbar ctermbg=0 ctermfg=9

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END

" カーソル行のスタイル
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
:set lazyredraw
" 高速ターミナル接続を行う
:set ttyfast

" フォント設定
if has('unix') || has('mac') && has('gui')
	set guifont="Ricty":h14
endif

" if has('win32')
" set guifont=MS_Gothic:h10:cSHIFTJIS
" set linespace=1
" if has('kaoriya')
" set ambiwidth=auto
" endif
" elseif has('mac')
" set guifont=Osakaー等幅:h14
" elseif has('xfontset')
" set guifontset=a14,r14,k14:
" endif

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &binary=1
  au BufReadPost * if &binary | %!xxd
  au BufReadPost * set ft=xxd | endif
  au BufWritePre * if &binary | %!xxd -r
  au BufWritePre * endif
  au BufWritePost * if &binary | %!xxd
  au BufWritePost * set nomod | endif
augroup END


