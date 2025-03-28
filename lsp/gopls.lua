--- @type vim.lsp.Config
return {
    cmd = { 'gopls' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    },
}
