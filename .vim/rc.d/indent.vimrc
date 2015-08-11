"---------------------------------------------------------------------------------
" Indent
"---------------------------------------------------------------------------------
set autoindent	" 自動インデント
" set paste		" ペースト時にautoindentを無効
set smartindent	" 改行後のインデント量を合わせる
set cindent		" Cプログラムの自動インデント

set tabstop=2
set shiftwidth=2
set softtabstop=0
set noexpandtab

" インデント無効
"autocmd FileType php filetype indent off
" autocmd FileType htm :set indentexpr=
" autocmd FileType html :set indentexpr=
" autocmd FileType xhtml :set indentexpr=

""" 自動括弧 '''
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" vnoremap { "zdi{<C-R>z}<ESC>
" vnoremap [ "zdi[<C-R>z]<ESC>
" vnoremap ( "zdi(<C-R>z)<ESC>
" vnoremap " "zdi"<C-R>z"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

