"---------------------------------------------------------------------------------
" Edit
"---------------------------------------------------------------------------------
" ノーマルモードで<C-^>無効化
" nnoremap <silent> <C-^> <Nop>
"IME状態に応じたカーソル色を設定
if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif

" augroup InsModeAu
    " autocmd!
    " autocmd InsertEnter,CmdwinEnter * set noimdisable
    " autocmd InsertLeave,CmdwinLeave * set imdisable
" augroup END

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>


" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>
" Visualモードでのpで選択範囲をレジスタの内容に置き換える
vnoremap p <Esc>;let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" コンマの後に自動的にスペースを挿入
" inoremap , ,<Space>

" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" :Ptでインデントモード切替
command! Pt :set paste!

" 読み込み時にスペースをタブに変換
"autocmd BufReadPost * :%s/[\ ]\{4}/\t/ge
" 保存時にタブをスペースに変換
"autocmd BufWritePre * :%s/\t/    /ge

" Python
autocmd BufReadPre *.py :set expandtab
autocmd BufReadPre *.py :set tabstop=4
autocmd BufReadPre *.py :set shiftwidth=4
" Html
autocmd BufReadPre *.html :set expandtab
autocmd BufReadPre *.html :set tabstop=4
autocmd BufReadPre *.html :set shiftwidth=4
" C#
autocmd BufReadPre *.cs :set expandtab
autocmd BufReadPre *.cs :set tabstop=4
autocmd BufReadPre *.cs :set shiftwidth=4


" ファイル保存時コマンド
if expand("%:e") != "md"
	" シンタックスチェック
	" autocmd BufWritePre *.cs :OmniSharpFindSyntaxErrors

	" 行末の空白を除去
	autocmd BufWritePre * :%s/\s\+$//ge

	" bomb を付与
	autocmd BufWritePre *.cs :set fenc=utf-8 bomb
endif

if has("unix") && match(system("uname"),'Darwin') != -1
	" UTF8保存時にMacのファイル拡張属性を付加
	autocmd BufWritePost * call SetUTF8Xattr(expand("<afile>"))
	function! SetUTF8Xattr(file)
		if &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
			call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
		endif
	endfunction
endif

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
