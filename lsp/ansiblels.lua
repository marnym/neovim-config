--- @type vim.lsp.Config
return {
    cmd = { 'ansible-language-server', '--stdio' },
    filetypes = { 'yml', 'yaml', 'yml.ansible', 'yaml.ansible' },
    root_markers = { 'ansible.cfg' },
    single_file_support = false,
}
