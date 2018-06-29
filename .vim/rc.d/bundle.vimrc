"---------------------------------------------------------------------------------
" Plugins
"---------------------------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 非同期アップデート
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'rosstimson/scala-vim-support'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'vim-scripts/applescript.vim'
NeoBundle 'vim-scripts/csv.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'solarnz/thrift.vim'

" for Rails
NeoBundle 'tpope/vim-rails'

" for Ruby
NeoBundle 'tpope/vim-endwise'
NeoBundle 'scrooloose/syntastic'

" for elixir
NeoBundle "elixir-lang/vim-elixir"
NeoBundle 'elmcast/elm-vim'

" for Golang
NeoBundle 'fatih/vim-go'

" for Vue.js
NeoBundle 'posva/vim-vue'

NeoBundleLazy 'nosami/Omnisharp', {
    \    'autoload': {'filetypes': ['cs']},
    \    'build': {
    \        'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
    \        'mac': 'xbuild server/OmniSharp.sln',
    \        'unix': 'xbuild server/OmniSharp.sln',
    \    }
    \}

call neobundle#end()

filetype plugin indent on

NeoBundleCheck


"------------------------------------
" vimfiler
"------------------------------------
nnoremap <leader>e :VimFilerExplorer<cr>
let g:vimfiler_ignore_pattern = '\%(\.pyc\|\.meta\)$'


"------------------------------------
" Gundo
"------------------------------------
nnoremap <leader>g :GundoToggle<cr>


"------------------------------------
" neocomplete
"------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0
let g:neocomplet#enable_smart_case = 1


"------------------------------------
" ref
"------------------------------------
let g:ref_phpmanual_path = $HOME . '/.vim/ref/php-chunked-xhtml'


"------------------------------------
" NERD_comments
"------------------------------------
let NERDSpaceDelims=1 " 挿入コメントにスペースを入れる


"------------------------------------
" syntastic
"------------------------------------
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
nnoremap <leader>sr :SyntasticCheck rubocop<CR>
