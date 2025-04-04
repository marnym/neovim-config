--- @type vim.lsp.Config
return {
    cmd = { 'deno', 'lsp' },
    root_markers = { 'deno.json', 'deno.jsonc' },
    filetypes = { 'typescript, typescriptreact, typescript.tsx' },
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
