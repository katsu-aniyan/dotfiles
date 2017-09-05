"autocmd!

"""""" dein 
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
"  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
   execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/neomru.vim')

" github
call dein#add('thinca/vim-quickrun')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('lambdalisue/unite-grep-vcs')
call dein#add('kana/vim-submode')
  :

call dein#end()

if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
"""""" dein end

""文字コード関連 参考
"http://qiita.com/take4s5i/items/a347be456b2f1312150c
"
set encoding=utf-8
""ファイル書き込み時の文字コード(バッファ→ファイル時に必要あらば変換される)
set fileencoding=utf-8
"読み込み時の文字コード
set fileencodings=utf-8,cp932

set number
set incsearch
set hlsearch
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set autoindent
set showmode
set showmatch
set noswapfile
set nobackup
set clipboard+=unnamed
set formatoptions=q
au BufEnter * execute ":lcd " . expand("%:p:h")
set cursorline
set virtualedit=block
set smartindent

""""""""""
"" key map
""""""""""
nnoremap <Enter> i<Enter><ESC>
noremap j gj
noremap gj j
noremap k gk
noremap gk k
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap ; :
nnoremap <silent> ,fa ggVG=

" for unite keymap
nnoremap <silent> ,ut :<C-u>Unite tab<CR>
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,gp :<C-u>Unite grep -buffer-name=search-buffer<CR>
nnoremap <silent> ,gt :<C-u>Unite grep/git -buffer-name=search-buffer<CR>

" key mapping memo
" gt : show next tab
" gT ; show prev tab
"

" key mpapping for vim-submode
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

" 大文字小文字を区別しない
let g:unite_enable_start_insert=1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" default action 
call unite#custom#default_action('file,buffer' , 'tabopen')

" " grep検索
"nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" " カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" NERDTree
nnoremap <silent> ,nt :<C-u>NERDTreeToggle<CR>

"""""""""
"" unite option
"""""""""
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" python のdocstringの表示をOFFにする
autocmd FileType python setlocal completeopt-=preview

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:quickrun_config = {
\  '*' : {'split' : 'vsplit'},
\  'python': {
\    'command': 'python3'
\  },
\}
set splitright

