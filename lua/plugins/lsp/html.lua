local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.html.setup { capabilities = capabilities, on_attach = on_attach }
    lsp.cssls.setup { capabilities = capabilities, on_attach = on_attach }
end

return M
