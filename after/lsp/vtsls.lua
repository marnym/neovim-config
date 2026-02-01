--- @type vim.lsp.Config
return {
    settings = {
        typescript = {
            tsdk = './.yarn/sdks/typescript/lib',
        },
        vtsls = {
            autoUseWorkspaceTsdk = true,
            javascript = {
                format = {
                    enable = false,
                },
            },
            typescript = {
                format = {
                    enable = false,
                },
            },
        },
    },
}
