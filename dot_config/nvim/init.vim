" 基础设置
lua require('basic')
source ~/.config/nvim/my_configs.vim
source ~/.config/nvim/vimrcs/filetypes.vim
" source ~/.config/nvim/vimrcs/extended.vim
" source ~/.config/nvim/vimrcs/basic.vim

" Packer插件管理
lua require('plugins')
" 快捷键映射
lua require('keybindings')
" 皮肤设置
" colorscheme kanagawa
colorscheme gruvbox
" let g:airline_theme='deus'
" let g:airline_theme='zenburn'
let g:airline_theme='gruvbox'

" 插件配置
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/nvim-tree')
" lua require('lspconfig')
" lua require('lsp/setup')
lua require('plugin-config/nvim-cmp')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable_virtual_text = true
    -- [options]
  },
}
EOF
