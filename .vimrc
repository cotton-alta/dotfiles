" 文字コードの設定

set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" タブ, インデントの設定
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2

" 検索の設定
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" カーソル移動の設定
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" NeoBundleの設定
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install NeoBundle..."
    call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------

NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'w0rp/ale'

NeoBundle 'itchyny/lightline.vim'

"----------------------------------------------------------
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" カラースキーマの設定
syntax enable
set t_Co=256
set background=dark
colorscheme hybrid

" ファイルツリーの設定
map <C-n> :NERDTreeToggle<CR>

" Lintの設定
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ }
let g:ale_sign_column_always = 1

" lightlineの設定
let g:lightline = {}
set laststatus=2
