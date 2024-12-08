local M = {}

M.setup = function(lsp, capabilities)
    lsp.terraformls.setup { capabilities = capabilities }
end

return M
