--- @type vim.lsp.Config
return {
    cmd = { 'superhtml', 'lsp' },
    root_markers = { 'package.json', 'deno.json', '.git' },
    filetypes = { 'superhtml', 'html' },
}
