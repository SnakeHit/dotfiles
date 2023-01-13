return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- theme
    use {"morhetz/gruvbox"}
    use {"dracula/vim"}
    use "rebelot/kanagawa.nvim"
    use "jiangmiao/auto-pairs"
    use "joom/vim-commentary"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[require('plugin-config.nvim-tree')]]
    }
    use {
        "greymd/oscyank.vim"
    }
    -- use {
    --     "easymotion/vim-easymotion"
    -- }
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text
    use {
        'andymass/vim-matchup'
    }
    -- 这个插件可以使用 [<Space> 添加空行
    use {
        "tpope/vim-unimpaired"
    }
    use {
        "tpope/vim-repeat"
    }
    use {"vim-airline/vim-airline"}
    use {"vim-airline/vim-airline-themes"}
    -- use 'itchyny/lightline.vim'
    -- use ({
    --     "nvim-lualine/lualine.nvim",
    --     config = [[require('plugin-config.statusline')]],
    -- })

    -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    -- use({ "williamboman/nvim-lsp-installer" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    --
    --
    use({"hrsh7th/nvim-cmp"})
    use("hrsh7th/vim-vsnip")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 
    --
    -- use({ "jose-elias-alvarez/nvim-lsp-ts-utils"})
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}


    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'gelguy/wilder.nvim',
        config = function()
            -- config goes here
        end,
    }

    -- use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require"telescope".load_extension("frecency")
        end,
        requires = {"kkharji/sqlite.lua"}
    }

    use { 
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
            require("telescope").load_extension "file_browser"
        end,
    }

    use {
        "nvim-telescope/telescope-project.nvim",
        config = function()
            require'telescope'.load_extension('project')
        end,
    }

    -- Python indent (follows the PEP8 style)
    use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

    -- Lua
    -- use {
    --     'abecodes/tabout.nvim',
    --     config = function()
    --         require('tabout').setup {
    --             tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    --             backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    --             act_as_tab = true, -- shift content if tab out is not possible
    --             act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    --             default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    --             default_shift_tab = '<C-d>', -- reverse shift default action,
    --             enable_backwards = true, -- well ...
    --             completion = true, -- if the tabkey is used in a completion pum
    --             tabouts = {
    --                 {open = "'", close = "'"},
    --                 {open = '"', close = '"'},
    --                 {open = '`', close = '`'},
    --                 {open = '(', close = ')'},
    --                 {open = '[', close = ']'},
    --                 {open = '{', close = '}'}
    --             },
    --             ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    --             exclude = {} -- tabout will ignore these filetypes
    --         }
    --     end,
    --     wants = {'nvim-treesitter'}, -- or require if not used so far
    --     -- after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    -- }
    use {
        "kevinhwang91/nvim-hlslens",
        branch = "main",
        keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
        config = [[require('plugin-config.hlslens')]],
    }
    use {"vim-scripts/bufexplorer.zip"}
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = [[require('plugin-config.alpha')]]
        -- config = function ()
        --     require'alpha'.setup(require'alpha.themes.startify'.config)
        -- end
    }
end)
