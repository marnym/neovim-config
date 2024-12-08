local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.ltex.setup {
        cmd = { '/home/markus/dev/ltex-ls-plus/target/appassembler/bin/ltex-ls-plus' },
        filetypes = { 'typst' },
        autostart = false,
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ltex = {
                enabled = { 'typst' },
                checkFrequency = 'save',
                language = 'en-US',
                sentenceCacheSize = 5000,
            },
        },
    }

    lsp.texlab.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lsp.util.root_pattern('*.tex'),
    }

    lsp.tinymist.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = lsp.util.root_pattern('main.typ'),
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
end

return M
