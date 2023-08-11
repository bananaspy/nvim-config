local lsp = require('lsp-zero').preset({})

-- (Optional) Configure lua language server for neovim
local cfg = require('lspconfig')
cfg.lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
        'tsserver',
        'eslint',
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        -- lsp.default_keymaps({buffer = bufnr})

        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d>", function() vim.diagnostic.goto_next() end, opts)
end)

lsp.setup()

local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

cmp.setup({
        preselect = 'item',
        completion = {
                completeopt = 'menu,menuone,noinsert'
        },
        window = {
                documention = cmp.config.window.bordered(),
        },
        sources = {
                {name = 'path'},
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
                {name = 'buffer', keyword_length = 3},
                {name = 'luasnip', keyword_length = 2},
        },
        mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['C-o'] = cmp.mapping.complete(),
        },
})

vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
        },
})

