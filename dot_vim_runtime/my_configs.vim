" -- mapping -------------------------------------------------------
nmap <CR> o<Esc>
nnoremap H ^
nnoremap L $
nnoremap x "_x
nnoremap X "_X
inoremap qq <Esc>
nnoremap ; :
xnoremap ; :

" -- setting  -------------------------------------------------------
set ttymouse=xterm2 " 目的是在tmux 中也正常使用
set mouse=a
set clipboard=unnamed
set showcmd
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set cursorline
