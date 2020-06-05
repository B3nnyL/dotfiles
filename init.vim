let mapleader = " "
let g:mapleader = " "

"ui
set ruler
set number

"line break
set linebreak
set textwidth=500

" indent
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"search
set ignorecase
set smartcase
set incsearch
set hlsearch

set mouse=a

" font
set guifont=Fira\ Code\

" keybinding
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>f :FZF<cr>
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree',                    { 'on':  'NERDTreeToggle' }
" List ends here. Plugins berome visible to Vim after this call.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

" language
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript',                { 'for': 'javascript' }
Plug 'othree/html5.vim',                       { 'for': 'html' }
Plug 'jremmen/vim-ripgrep'
call plug#end()

"theme
colo nord

"nerdtree
let g:NERDTreeMouseMode=3
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
