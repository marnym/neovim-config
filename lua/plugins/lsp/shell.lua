local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.bashls.setup { capabilities = capabilities, on_attach = on_attach }
end

return M
