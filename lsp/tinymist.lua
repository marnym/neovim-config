--- @type vim.lsp.Config
return {
    root_markers = { 'main.typ' },
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
