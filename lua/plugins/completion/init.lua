return {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
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
    version = 'v0.*',
    opts = require('plugins.completion.config'),
}
