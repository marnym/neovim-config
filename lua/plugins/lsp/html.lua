local M = {}

M.setup = function(lsp, capabilities)
    lsp.html.setup { capabilities = capabilities }
    lsp.superthtml.setup { capabilities = capabilities }
    lsp.cssls.setup { capabilities = capabilities }
end

return M
