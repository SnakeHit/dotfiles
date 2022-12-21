" -- mapping -------------------------------------------------------
nmap <CR> o<Esc>
nnoremap H ^
nnoremap L $
nnoremap x "_x
nnoremap X "_X
nnoremap ; :
xnoremap ; :
inoremap jk <Esc>

" -- setting  -------------------------------------------------------
set ttymouse=xterm2 " 目的是在tmux 中也正常使用
set mouse=a
set clipboard=unnamed
set showcmd
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set cursorline
colorscheme gruvbox

" -- easymotion ------------------------------------------------------
nmap f <Plug>(easymotion-s)
nmap F <Plug>(easymotion-F)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
