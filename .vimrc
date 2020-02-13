" set runtimepath+=~/vimsrc/vim-polyglot
" set runtimepath+=~/vimsrc/vimdoc-ja
"
" reference for vim script
" https://knowledge.sakura.ad.jp/23436/

call plug#begin()
Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-quickrun'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" add completion plugin deoplate
let g:deoplete#enable_at_startup = 1
" add go-completion plugin for deoplete
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

"""""""""""""""""""""""
" basic settings
"""""""""""""""""""""""
set nocompatible
syntax enable
filetype plugin indent on

"""""""""""""""""""""""
set number
set helplang=ja,en

set hlsearch
nohlsearch

colorscheme elflord


"""""""""""""""""""""""
" quickfix
"""""""""""""""""""""""
autocmd QuickFixCmdPost *grep* cwindow
set modifiable

"""""""""""""""""""""""
" keymapping
"""""""""""""""""""""""

" Leader
let mapleader=","

nnoremap ; :
nnoremap <C-p> :cp<CR>
nnoremap <C-n> :cn<CR>
nnoremap <silent> <C-j> :bp<CR>
nnoremap <silent> <C-k> :bn<CR>

" benri
nnoremap H ^
nnoremap L $

" delete highright
nnoremap <ESC><ESC> :nohlsearch<CR>

" I want to each file type
" inoremap <Tab> <C-x><C-o>

" quickrun
nnoremap <Leader>r :<C-U>QuickRun<CR>

" vim-go
nnoremap [vim-go] <Nop>
nmap <Leader>g [vim-go]
nnoremap <silent> [vim-go]b :GoBuild<CR>
nnoremap <silent> [vim-go]d :GoDef<CR>
nnoremap <silent> [vim-go]dc :GoDoc<CR>

let g:ctrlp_map = '<Nop>'
nnoremap [ctrl-p] <Nop>
nmap <Leader>c [ctrl-p]
nnoremap <silent>  [ctrl-p]p :CtrlP<CR>

nnoremap [nerdtree] <Nop>
nmap <Leader>n [nerdtree]
nnoremap <silent> [nerdtree]t :NERDTreeToggle<CR>

nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

"""""""""""""""""""""""

" enable buffer switching without saving
set hidden

set tabstop=4
set shiftwidth=4


"""""""""""""""""""""""
" plugin setting for my session.vim
let g:session_path='/data/data/com.termux/files/home/vim_session'

