" set runtimepath+=~/vimsrc/vim-polyglot
" set runtimepath+=~/vimsrc/vimdoc-ja

call plug#begin()
Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-quickrun'
call plug#end()

"""""""""""""""""""""""
" basic settings
"""""""""""""""""""""""
set nocompatible
syntax enable
filetype plugin indent on

"""""""""""""""""""""""
set number
set helplang=ja,en




"""""""""""""""""""""""
" quickfix
"""""""""""""""""""""""
autocmd QuickFixCmdPost *grep* cwindow

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

" I want to each file type
inoremap <Tab> <C-x><C-o>

" quickrun
nnoremap <Leader>r :<C-U>QuickRun<CR>

" vim-go
nnoremap [vim-go] <Nop>
nmap <Leader>g [vim-go]
nnoremap <silent> [vim-go]b :GoBuild<CR>
nnoremap <silent> [vim-go]d :GoDef<CR>
nnoremap <silent> [vim-go]dc :GoDoc<CR>


"""""""""""""""""""""""

" enable buffer switching without saving
set hidden

set tabstop=4
set shiftwidth=4
