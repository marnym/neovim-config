require('plugins.lsp.clangd')
require('plugins.lsp.metals')
require('plugins.lsp.neovim')
require('plugins.lsp.rust')

vim.pack.add {
    {
        src = 'https://github.com/neovim/nvim-lspconfig',
        version = vim.version.range('v2.*'),
    },
}

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
    root_markers = { '.git' },
})
