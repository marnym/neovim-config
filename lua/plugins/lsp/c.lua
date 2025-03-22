local M = {}

M.setup = function(lsp, capabilities)
    local clangd_capabilities = vim.deepcopy(capabilities)
    clangd_capabilities.offsetEncoding = 'utf-8'
    lsp.clangd.setup { capabilities = clangd_capabilities }
end

return M
