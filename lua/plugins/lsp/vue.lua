local M = {}

M.setup = function(lsp, capabilities)
    lsp.volar.setup { capabilities = capabilities }
end

return M
