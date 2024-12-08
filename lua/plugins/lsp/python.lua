local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.basedpyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            basedpyright = {
                typeCheckingMode = 'standard',
            },
        },
    }
end

return M
