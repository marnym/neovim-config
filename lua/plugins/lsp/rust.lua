vim.pack.add {
    {
        src = 'https://github.com/mrcjkb/rustaceanvim',
        version = 'v7.1.8',
    },
}

vim.g.rustaceanvim = {
    server = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        default_settings = {
            ['rust-analyzer'] = {
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                    features = 'all',
                },
                procMacro = {
                    enable = true,
                },
                lru = {
                    capacity = 256,
                },
            },
        },
    },
}
