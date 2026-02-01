vim.pack.add {
    'https://github.com/b0o/SchemaStore.nvim',
}

vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
        },
    },
})
