--- @type vim.lsp.Config
return {
    root_markers = { 'deno.json', 'deno.jsonc' },
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
    settings = {
        deno = {
            enable = true,
            unstable = true,
            suggest = {
                imports = {
                    hosts = {
                        ['https://deno.land'] = true,
                    },
                },
            },
        },
    },
}
