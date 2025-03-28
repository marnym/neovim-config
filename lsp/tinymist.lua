--- @type vim.lsp.Config
return {
    cmd = { 'tinymist' },
    root_markers = { 'main.typ' },
    filetypes = { 'typst' },
    settings = {
        exportPdf = 'never',
        systemFonts = true,
        semanticTokens = 'disable',
        compileStatus = 'disable',
        dragAndDrop = 'disable',
        renderDocs = 'disable',
        previewFeature = 'disable',
    },
}
