--- @type vim.lsp.Config
return {
    cmd = { 'harper-ls', '--stdio' },
    root_markers = { '*.typ', '.git' },
    filetypes = { 'gitcommit', 'markdown', 'typst' },
}
