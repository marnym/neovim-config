--- @type vim.lsp.Config
return {
    cmd = { 'vscode-css-language-server', '--stdio' },
    root_markers = { 'package.json', 'deno.json', '.git' },
    filetypes = { 'css', 'scss', 'less' },
}
