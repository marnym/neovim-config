local M = {}

M.setup = function(lsp, capabilities)
    lsp.ansiblels.setup {
        capabilities = capabilities,
        filetypes = { 'yml', 'yaml', 'yml.ansible', 'yaml.ansible' },
        root_dir = lsp.util.root_pattern('ansible.cfg'),
        single_file_support = false,
        cmd = { 'npx', '--yes', '@ansible/ansible-language-server', '--stdio' }, -- don't like this either
    }
end

return M
