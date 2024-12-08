local M = {}

M.setup = function(lsp, capabilities)
    lsp.zls.setup { capabilities = capabilities }
end

return M
