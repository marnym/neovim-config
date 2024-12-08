local M = {}

M.setup = function(lsp, capabilities)
    lsp.basedpyright.setup {
        capabilities = capabilities,
        settings = {
            basedpyright = {
                typeCheckingMode = 'standard',
            },
        },
    }
end

return M
