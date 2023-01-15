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
autocmd! bufwritepost ~/.config/nvim/my_configs.vim source ~/.config/nvim/my_configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.config/nvim/temp_dirs/undodir
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
map <C-space> ?

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

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

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

" -- easymotion ------------------------------------------------------
" nmap s <Plug>(easymotion-s)
" nmap t <Plug>(easymotion-t)
" nmap f <Plug>(easymotion-f)
" nmap F <Plug>(easymotion-F)
" let g:EasyMotion_smartcase = 1
" map <Leader><leader>h <Plug>(easymotion-linebackward)
" map <Leader><leader>l <Plug>(easymotion-lineforward)

" -- airlinetoggletrailing
let g:airline#extensions#whitespace#enabled = 0

""""""""""""""""""""""""""""""wilder.nvim settings""""""""""""""""""""""""""""""
" call timer_start(250, { -> s:wilder_init() })

" function! s:wilder_init() abort
"   try
"     call wilder#setup({
"           \ 'modes': [':', '/', '?'],
"           \ 'next_key': '<Tab>',
"           \ 'previous_key': '<S-Tab>',
"           \ 'accept_key': '<C-y>',
"           \ 'reject_key': '<C-e>'
"           \ })

"     call wilder#set_option('pipeline', [
"           \   wilder#branch(
"           \     wilder#cmdline_pipeline({
"           \       'language': 'python',
"           \       'fuzzy': 1,
"           \       'sorter': wilder#python_difflib_sorter(),
"           \       'debounce': 30,
"           \     }),
"           \     wilder#python_search_pipeline({
"           \       'pattern': wilder#python_fuzzy_pattern(),
"           \       'sorter': wilder#python_difflib_sorter(),
"           \       'engine': 're',
"           \       'debounce': 30,
"           \     }),
"           \   ),
"           \ ])

"     let l:hl = wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}])
"     call wilder#set_option('renderer', wilder#popupmenu_renderer({
"           \ 'highlighter': wilder#basic_highlighter(),
"           \ 'max_height': 15,
"           \ 'highlights': {
"           \   'accent': l:hl,
"           \ },
"           \ 'left': [' ', wilder#popupmenu_devicons(),],
"           \ 'right': [' ', wilder#popupmenu_scrollbar(),],
"           \ 'apply_incsearch_fix': 0,
"           \ }))
"   catch /^Vim\%((\a\+)\)\=:E117/
"     echohl Error |echomsg "Wilder.nvim missing: run :PackerSync to fix."|echohl None
"   endtry
" endfunction


"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" " Do not use cache file
" let g:Lf_UseCache = 0
" " Refresh each time we call leaderf
" let g:Lf_UseMemoryCache = 0

" " Ignore certain files and directories when searching files
" let g:Lf_WildIgnore = {
"   \ 'dir': ['.git', '__pycache__', '.DS_Store'],
"   \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
"   \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
"   \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
"   \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
"   \ '*.mp3', '*.aac']
"   \}

" " Only fuzzy-search files names
" let g:Lf_DefaultMode = 'FullPath'

" " Popup window settings
" let w = float2nr(&columns * 0.8)
" if w > 140
"   let g:Lf_PopupWidth = 140
" else
"   let g:Lf_PopupWidth = w
" endif

" let g:Lf_PopupPosition = [0, float2nr((&columns - g:Lf_PopupWidth)/2)]

" " Do not use version control tool to list files under a directory since
" " submodules are not searched by default.
" let g:Lf_UseVersionControlTool = 0

" " Use rg as the default search tool
" let g:Lf_DefaultExternalTool = "rg"

" " show dot files
" let g:Lf_ShowHidden = 1

" " Disable default mapping
" let g:Lf_ShortcutF = ''
" let g:Lf_ShortcutB = ''

" " set up working directory for git repository
" let g:Lf_WorkingDirectoryMode = 'a'

" " Search files in popup window
" nnoremap <silent> <leader>ff :<C-U>Leaderf file --popup<CR>

" " Grep project files in popup window
" nnoremap <silent> <leader>fg :<C-U>Leaderf rg --no-messages --popup<CR>

" " Search vim help files
" nnoremap <silent> <leader>fh :<C-U>Leaderf help --popup<CR>

" " Search tags in current buffer
" nnoremap <silent> <leader>ft :<C-U>Leaderf bufTag --popup<CR>

" " Switch buffers
" nnoremap <silent> <leader>fb :<C-U>Leaderf buffer --popup<CR>

" " Search recent files
" nnoremap <silent> <leader>fr :<C-U>Leaderf mru --popup --absolute-path<CR>

" " change the color for leaderf
" " let g:Lf_PopupColorscheme = 'gruvbox_material'
" let g:Lf_PopupColorscheme = 'onedark'

" " Change keybinding in LeaderF prompt mode, use ctrl-n and ctrl-p to navigate
" " items.
" let g:Lf_CommandMap = {'<C-J>': ['<C-N>'], '<C-K>': ['<C-P>']}

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
" let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
" The bufExplorerFindActive cause a bug, when save the file cause other tabs close
" let g:bufExplorerFindActive=1
" let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


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
