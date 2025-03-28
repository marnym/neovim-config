--- @type vim.lsp.Config
return {
    cmd = { '/home/markus/dev/ltex-ls-plus/target/appassembler/bin/ltex-ls-plus' },
    filetypes = { 'typst' },
    settings = {
        ltex = {
            enabled = { 'typst' },
            checkFrequency = 'save',
            language = 'en-US',
            sentenceCacheSize = 5000,
        },
    },
}
