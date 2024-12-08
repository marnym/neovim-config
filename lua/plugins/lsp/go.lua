local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        },
        init_options = {
            usePlaceholders = true,
        },
    }
end

return M
