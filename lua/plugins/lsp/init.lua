return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help, { border = 'rounded' }
            )

            local lsp = require('lspconfig')

            local capabilities = require('blink.cmp').get_lsp_capabilities()
            capabilities.offsetEncoding = { 'utf-8' }

            require('plugins.lsp.ansible').setup(lsp, capabilities)
            require('plugins.lsp.c').setup(lsp, capabilities)
            require('plugins.lsp.documents').setup(lsp, capabilities)
            require('plugins.lsp.go').setup(lsp, capabilities)
            require('plugins.lsp.html').setup(lsp, capabilities)
            require('plugins.lsp.json').setup(lsp, capabilities)
            require('plugins.lsp.lua').setup(lsp, capabilities)
            require('plugins.lsp.markdown').setup(lsp, capabilities)
            require('plugins.lsp.nix').setup(lsp, capabilities)
            require('plugins.lsp.python').setup(lsp, capabilities)
            require('plugins.lsp.rust').setup(lsp, capabilities)
            require('plugins.lsp.shell').setup(lsp, capabilities)
            require('plugins.lsp.typescript').setup(lsp, capabilities)
            require('plugins.lsp.vue').setup(lsp, capabilities)
            require('plugins.lsp.yaml').setup(lsp, capabilities)
            require('plugins.lsp.zig').setup(lsp, capabilities)

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
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ui = {
                icons = {
                    server_installed = '✓',
                    server_pending = '➜',
                    server_uninstalled = '✗',
                },
            },
        },
    },
    {
        'scalameta/nvim-metals',
        dependencies = { 'nvim-lua/plenary.nvim' },
        ft = { 'scala', 'sbt' },
        config = function()
            local metals_config = require('metals').bare_config()
            metals_config.settings = {
                showImplicitArguments = true,
                excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
            }

            local nvim_metals_group = vim.api.nvim_create_augroup('NvimMetals', { clear = true })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'scala', 'sbt' },
                callback = function()
                    require('metals').initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end,
    },
    {
        'yioneko/nvim-vtsls',
    },
}
