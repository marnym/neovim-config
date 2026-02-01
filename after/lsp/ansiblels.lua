--- @type vim.lsp.Config
return {
    cmd = { 'deno', 'run', '-A', 'npm:@ansible/ansible-language-server@1.2.3', '--stdio' },
    filetypes = { 'yml', 'yaml', 'yml.ansible', 'yaml.ansible' },
    settings = {
        ansible = {
            validation = {
                enabled = false,
                lint = {
                    enabled = false,
                },
            },
        },
    },
}
