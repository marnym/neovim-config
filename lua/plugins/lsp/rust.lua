local M = {}

M.setup = function(lsp, capabilities, on_attach)
    vim.g.rustaceanvim = {
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
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
end

return M
