local M = {}

M.setup = function(lsp, capabilities)
    vim.g.rustaceanvim = {
        server = {
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
