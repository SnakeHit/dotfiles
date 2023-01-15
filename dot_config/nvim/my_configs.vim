" -- mapping -------------------------------------------------------
nmap <CR> o<Esc>
nnoremap H ^
nnoremap L $
nnoremap x "_x
nnoremap X "_X
nnoremap ; :
xnoremap ; :
inoremap jk <Esc>

" Key bindings can be changed, see below
" call wilder#setup({'modes': [':', '/', '?']})

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" -- setting  -------------------------------------------------------
" set ttymouse=xterm2 " 目的是在tmux 中也正常使用
set mouse=a
set clipboard^=unnamed,unnamedplus
set showcmd
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set tabline=%t
" set the cursorlinenumber color NOT cursorline
set cursorline
set cursorlineopt=number
set guicursor=i:block

" map in a new line
nnoremap <Leader>p :pu<CR>
nnoremap <Leader>P :pu!<CR>


" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" delete backwards fully
nmap db dvb
nmap dT dvT
nmap dF dvF
nmap cb cvb
nmap cT cvT
nmap cF cvF

" save quickly
nmap <leader>w :w!<cr>
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.config/nvim/my_configs.vim<cr>
" autocmd! bufwritepost ~/.config/nvim/my_configs.vim source ~/.config/nvim/my_configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" set ignorecase - All your searches will be case insensitive
" set smartcase - Your search will be case sensitive if it contains an uppercase letter
set ignorecase
set smartcase

filetype plugin indent on
"Python Settings
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set textwidth=80
autocmd FileType python set smartindent
autocmd FileType python set shiftwidth=4
autocmd FileType python map <buffer> <F2> :w<CR>:exec '! python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:exec '! python' shellescape(@%, 1)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>d :bdelete<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" -- airlinetoggletrailing
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#nvimlsp#enabled = 0

""""""""""""""""""""""""""""""
" Telescope 
""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope frecency<cr>
nnoremap <leader>fe <cmd>Telescope oldfiles<cr>
nnoremap <leader>fc <cmd>Telescope command_history<cr>
nnoremap <leader>ft <cmd>Telescope tags<cr>
nnoremap <leader>fj <cmd>Telescope jumplist<cr>
nnoremap <leader>fm <cmd>Telescope man_pages sections=ALL<cr>
nnoremap <leader>fp <cmd>Telescope project<cr>

nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

""""""""""""""""""""""""""""""
" Vista
""""""""""""""""""""""""""""""
let g:vista_default_executive = 'nvim_lsp'

nnoremap <leader>t <cmd>Vista<cr>
