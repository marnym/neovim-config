--- @type vim.lsp.Config
return {
    cmd = { 'npx', '@ansible/ansible-language-server', '--stdio' },
    filetypes = { 'yml', 'yaml', 'yml.ansible', 'yaml.ansible' },
}
