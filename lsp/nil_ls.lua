--- @type vim.lsp.Config
return {
    cmd = { 'nil' },
    root_markers = { 'flake.nix', '.git' },
    filetypes = { 'nix' },
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
