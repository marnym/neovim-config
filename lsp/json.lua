local capabilities = require('blink.cmp').get_lsp_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--- @type vim.lsp.Config
return {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    capabilities = capabilities,
    settings = {
        json = {
            schemas = {
                {
                    fileMatch = { 'package.json' },
                    url = 'https://json.schemastore.org/package.json',
                },
                {
                    fileMatch = { 'tsconfig.json' },
                    url = 'https://json.schemastore.org/tsconfig.json',
                },
                {
                    fileMatch = { 'deno.json' },
                    url = 'https://deno.land/x/deno/cli/schemas/config-file.v1.json',
                },
            },
        },
    },
}
