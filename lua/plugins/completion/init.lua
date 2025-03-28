return {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
        'rafamadriz/friendly-snippets',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
                require('luasnip.loaders.from_vscode').lazy_load { paths = './snippets' }
            end,
        },
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            dependencies = { 'Bilal2453/luvit-meta', lazy = true },
            opts = {
                library = {
                    { path = 'luvit-meta/library', words = { 'vim%.uv' } },
                },
            },
        },
    },
    version = '1.*',
    opts = require('plugins.completion.config'),
}
