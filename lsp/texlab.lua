--- @type vim.lsp.Config
return {
    cmd = { 'texlab' },
    root_markers = { '.tex' },
    filetypes = { 'tex', 'plaintex', 'bib' },
}
