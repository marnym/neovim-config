local M = {}

M.setup = function(lsp, capabilities)
    local yaml_companion = require('yaml-companion')
    local yaml_cfg = yaml_companion.setup {
        lspconfig = { capabilities = capabilities },
    }
    lsp.yamlls.setup(yaml_cfg)

    vim.api.nvim_create_user_command('YamlSchema',
        function()
            local fzf = require('fzf-lua')
            fzf.register_ui_select()
            yaml_companion.open_ui_select()
            fzf.deregister_ui_select()
        end,
        {
            desc = 'Select YAML schema',
        }
    )
end

return M
