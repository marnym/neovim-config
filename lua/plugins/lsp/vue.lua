local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.volar.setup { on_attach = on_attach, capabilities = capabilities }
end

return M
