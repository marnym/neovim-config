local M = {}

M.setup = function(lsp, capabilities, on_attach)
    local yaml_cfg = require('yaml-companion').setup {
        lspconfig = {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    }
    lsp.yamlls.setup(yaml_cfg)
end

return M
