vim.lsp.buf.hover { border = 'rounded' }
vim.lsp.buf.signature_help { border = 'rounded' }

vim.lsp.enable {
    'ansiblels',
    'basedpyright',
    'bashls',
    'clangd',
    'cssls',
    'denols',
    'fish_lsp',
    'gopls',
    'html',
    'jsonls',
    'julials',
    'lua_ls',
    'marksman',
    'nil_ls',
    'superhtml',
    'terraformls',
    'texlab',
    'tinymist',
    'vue_ls',
    'vtsls',
    'yamlls',
    'zls',
}

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local bufnr = ev.buf
        if not bufnr then return end

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and vim.bo.filetype == 'vue' then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>re', vim.lsp.buf.rename, '[R]e[N]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')


        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap('gt', vim.lsp.buf.type_definition, '[Goto] [T]ype definition')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    end,
})
