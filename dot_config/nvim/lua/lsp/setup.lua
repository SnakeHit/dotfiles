local utils = require 'lsp/utils'
local root_pattern = utils.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
-- :h mason-default-settings
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "pyright",
    },
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- Enable underline, use default values
--     underline = true,
--     -- Enable virtual text, override spacing to 4
--     virtual_text = {
--         spacing = 4,
--     },
--     -- Use a function to dynamically turn signs off
--     -- and on, using buffer local variables
--     signs = function(namespace, bufnr)
--         return vim.b[bufnr].show_signs == true
--     end,
--     -- Disable a feature
--     update_in_insert = false,
-- }
-- )

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

-- Configure lsp information display style
-- replace the lsp info symbol
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- set the style of lsp info
local config = {
    -- disable virtual text
    -- the message show after the current line.
    virtual_text = false,
    -- show signs
    signs = function(namespace, bufnr)
        return vim.b[bufnr].show_signs == true
    end,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

-- set the popup window border
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

require'lspconfig'.pyright.setup{}
require('lspconfig')['clangd'].setup {
    cmd = { 
        "clangd", "--log=verbose" 
    },
    root_dir = function(fname)
      local filename = utils.path.is_absolute(fname) and fname
        or utils.path.join(vim.loop.cwd(), fname)
      return root_pattern(filename) or utils.path.dirname(filename)
    end;
    capabilities = capabilities
}
