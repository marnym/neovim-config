local capabilities = require('blink.cmp').get_lsp_capabilities()
capabilities.offsetEncoding = 'utf-8'

--- @type vim.lsp.Config
return {
    cmd = { 'clangd', '--background-index' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt' },
    filetypes = { 'c', 'cpp' },
    capabilities = capabilities,
}
