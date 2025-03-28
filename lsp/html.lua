--- @type vim.lsp.Config
return {
    cmd = { 'vscode-html-language-server', '--stdio' },
    root_markers = { 'package.json', 'deno.json', '.git' },
    filetypes = { 'html', 'templ', 'eta' },
}
