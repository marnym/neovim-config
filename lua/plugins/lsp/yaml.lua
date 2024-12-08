local M = {}

M.setup = function(lsp, capabilities)
    local yaml_cfg = require('yaml-companion').setup {
        lspconfig = { capabilities = capabilities },
    }
    lsp.yamlls.setup(yaml_cfg)
end

return M
