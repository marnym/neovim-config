local M = {}

M.setup = function(lsp, capabilities)
    lsp.marksman.setup { capabilities = capabilities }
end

return M
