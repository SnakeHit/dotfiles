" 基础设置
lua require('basic')
source ~/.config/nvim/my_configs.vim
" source ~/.config/nvim/vimrcs/filetypes.vim
" source ~/.config/nvim/vimrcs/extended.vim
" source ~/.config/nvim/vimrcs/basic.vim

" Packer插件管理
lua require('plugins')
" 快捷键映射
lua require('keybindings')
" 皮肤设置
colorscheme kanagawa
" colorscheme gruvbox
" let g:airline_theme='deus'
let g:airline_theme='zenburn'
" let g:airline_theme='gruvbox'

" 插件配置
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/nvim-tree')
" lua require('lspconfig')
lua require('lsp/setup')
lua require('plugin-config/nvim-cmp')
lua require('plugin-config/telescope')
lua require('plugin-config/bufferline')
lua require('plugin-config/hop')
lua require('plugin-config/gitsigns')
