local M = {}

M.setup = function(lsp, capabilities)
    lsp.bashls.setup { capabilities = capabilities }
end

return M
