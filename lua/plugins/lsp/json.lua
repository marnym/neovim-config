local M = {}

M.setup = function(lsp, capabilities, on_attach)
    local capabilities = vim.deepcopy(capabilities)
    capabilities.offsetEncoding = { 'utf-8' }
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lsp.jsonls.setup {
        on_attach = on_attach,
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
end

return M
