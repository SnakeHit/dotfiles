return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use "rebelot/kanagawa.nvim"
    use "jiangmiao/auto-pairs"
    use "joom/vim-commentary"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        "greymd/oscyank.vim"
    }
    use {
        "easymotion/vim-easymotion"
    }
    use {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        cond = firenvim_not_active,
        config = [[require('plugin-config.statusline')]],
    }
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
    use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }

    -- Python indent (follows the PEP8 style)
    use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

    -- Lua
    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    {open = "'", close = "'"},
                    {open = '"', close = '"'},
                    {open = '`', close = '`'},
                    {open = '(', close = ')'},
                    {open = '[', close = ']'},
                    {open = '{', close = '}'}
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = {'nvim-treesitter'}, -- or require if not used so far
        -- after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    }
    use {
        "kevinhwang91/nvim-hlslens",
        branch = "main",
        keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
        config = [[require('plugin-config.hlslens')]],
    }
    use {"vim-scripts/bufexplorer.zip"}
end)
