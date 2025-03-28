vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    root_markers = { '.git' },
})

vim.lsp.enable {
    'ansiblels',
    'basedpyright',
    'bashls',
    'clangd',
    'cssls',
    'denols',
    'gopls',
    'html',
    'json',
    'lua_ls',
    'marksman',
    'nil_ls',
    'superhtml',
    'tailwindcss',
    'terraformls',
    'texlab',
    'tinymist',
    'volar',
    'vtsls',
    'yamlls',
    'zls',
}
