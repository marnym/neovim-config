--- @type vim.lsp.Config
return {
    cmd = { 'zls' },
    root_markers = { 'zls.json', 'build.zig', '.git' },
    filetypes = { 'zig', 'zir' },
}
