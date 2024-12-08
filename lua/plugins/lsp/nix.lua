local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.nil_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ['nil'] = {
                nix = {
                    flake = {
                        autoArchive = true,
                    },
                },
            },
        },
    }
end

return M
