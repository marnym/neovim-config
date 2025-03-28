--- @type vim.lsp.Config
return {
    cmd = { 'terramform-ls', 'serve' },
    root_markers = { '.terraform', '.git' },
    filetypes = { 'terraform', 'terraform-vars' },
}
