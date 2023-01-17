-- -- Setup nvim-cmp.
-- local cmp = require("cmp")
-- local lspkind = require("lspkind")

-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       -- For `ultisnips` user.
--       vim.fn["UltiSnips#Anon"](args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ["<Tab>"] = function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       else
--         fallback()
--       end
--     end,
--     ["<S-Tab>"] = function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       else
--         fallback()
--       end
--     end,
--     -- ["<CR>"] = cmp.mapping.confirm { select = true },
--     ["<C-e>"] = cmp.mapping.abort(),
--     ["<Esc>"] = cmp.mapping.close(),
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--   },
--   sources = {
--     { name = "nvim_lsp" }, -- For nvim-lsp
--     { name = "ultisnips" }, -- For ultisnips user.
--     { name = "path" }, -- for path completion
--     { name = "buffer", keyword_length = 1 }, -- for buffer word completion
--     { name = "emoji", insert = true }, -- emoji completion
--   },
--   completion = {
--     keyword_length = 0,
--     completeopt = "menu,noselect",
--   },
--   view = {
--     entries = "custom",
--   },
--   formatting = {
--     format = lspkind.cmp_format {
--       mode = "symbol_text",
--       menu = {
--         nvim_lsp = "[LSP]",
--         ultisnips = "[US]",
--         nvim_lua = "[Lua]",
--         path = "[Path]",
--         buffer = "[Buffer]",
--         emoji = "[Emoji]",
--         omni = "[Omni]",
--       },
--     },
--   },
-- }


--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
-- vim.cmd([[
--   highlight! link CmpItemMenu Comment
--   " gray
--   highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--   " blue
--   highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--   highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--   " light blue
--   highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--   " pink
--   highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--   highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--   " front
--   highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--   highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--   highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]])
--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
      -- How to disable scrollbar?
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<Tab>"] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end
    }),
    ["<S-Tab>"] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end
    }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<C-n>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end
    }),
    ['<C-p>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end
    }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    --['<C-e>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    --['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
    -- ['<CR>'] = cmp.mapping({
    --   i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    --   c = function(fallback)
    --     if cmp.visible() then
    --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true})
    --     else
    --       fallback()
    --     end
    --   end
    -- }),
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        ultisnips = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },

  -- sources = cmp.config.sources({
  --   { name = 'nvim_lsp' },
  --   { name = 'ultisnips' },
  -- }, {
  --   { name = 'buffer' },
  --   { name = 'path' },
  -- })
    sources = {
      {name = "nvim_lsp"},
      {name = "path"},
      {name = "ultisnips"},
      {name = "buffer"},
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source foj `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  -- completion = { autocomplete = true },
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  -- completion = { autocomplete = true },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
