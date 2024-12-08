local M = {}

M.setup = function(lsp, capabilities)
    lsp.nil_ls.setup {
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
