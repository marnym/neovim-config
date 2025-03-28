local capabilities = require('blink.cmp').get_lsp_capabilities()

--- @type vim.lsp.Config
return {
    cmd = { 'marksman', 'server' },
    root_markers = { '.marksman.toml', '.git' },
    filetypes = { 'markdown', 'markdown.mdx' },
}
