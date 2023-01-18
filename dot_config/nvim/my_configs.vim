" -- mapping -------------------------------------------------------
nnoremap <CR> o<Esc>
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap x "_x
nnoremap X "_X
nnoremap ; :
xnoremap ; :
" inoremap jk <Esc>

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
set scrolloff=7
" set formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType * set formatoptions-=cro
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
nnoremap db dvb
nnoremap dT dvT
nnoremap dF dvF
nnoremap cb cvb
nnoremap cT cvT
nnoremap cF cvF

" save quickly
nnoremap <leader>w :w!<cr>
nnoremap <leader>W :wall!<cr>
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :e! ~/.config/nvim/my_configs.vim<cr>
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
nnoremap <space> /

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

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
nnoremap gd <cmd>Telescope lsp_definitions<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
" nnoremap gD <cmd>Telescope lsp_definitions<cr>

nnoremap <leader>gs <cmd>Gitsigns toggle_signs<cr>
" nnoremap <leader>gc <cmd>Telescope git_commits<cr>
" nnoremap <leader>gb <cmd>Telescope git_branches<cr>

""""""""""""""""""""""""""""""
" Vista
""""""""""""""""""""""""""""""
let g:vista_default_executive = 'nvim_lsp'

nnoremap <leader>t <cmd>Vista<cr>


""""""""""""""""""""""""""""""
" Ultisnaps
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-p>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips/']

""""""""""""""""""""""""""""""
" Bufferline
""""""""""""""""""""""""""""""
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>

" Close the current buffer
nnoremap <leader>d :bdelete<cr>
" map <leader>l :bnext<cr>
" map <leader>h :bprevious<cr>
nnoremap <silent><leader>l :BufferLineCycleNext<CR>
nnoremap <silent><leader>h :BufferLineCyclePrev<CR>
