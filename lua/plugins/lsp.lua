return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.lsp.buf.hover { border = 'rounded' }
            vim.lsp.buf.signature_help { border = 'rounded' }

            vim.api.nvim_create_autocmd('LspAttach', {
                pattern = { '*.js', '*.jsx', '*.ts', '*.tss' },
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    if client and client.name == 'denols' then
                        local clients = vim.lsp.get_clients {
                            bufnr = bufnr,
                            name = 'vtsls',
                        }
                        for _, c in ipairs(clients) do
                            vim.lsp.stop_client(c.id, true)
                        end
                    end

                    -- if vtsls attached, stop it if there is a denols server attached
                    if client and client.name == 'vtsls' then
                        if next(vim.lsp.get_clients { bufnr = bufnr, name = 'denols' }) then
                            vim.lsp.stop_client(client.id, true)
                        end
                    end
                end,
            })

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

            vim.lsp.config('*', {
                capabilities = require('blink.cmp').get_lsp_capabilities(),
                root_markers = { '.git' },
            })

            vim.lsp.enable {
                'ansiblels',
                'basedpyright',
                'bashls',
                'clangd',
                'cssls',
                'denols',
                'gopls',
                'harper_ls',
                'html',
                'json',
                'lua_ls',
                'marksman',
                'nil_ls',
                'superhtml',
                'tailwindcss',
                'terraformls',
                'texlab',
                'tinymist',
                'volar',
                'vtsls',
                'yamlls',
                'zls',
            }
        end,
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
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        ft = 'rust',
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    capabilities = require('blink.cmp').get_lsp_capabilities(),
                    default_settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },
                                features = 'all',
                            },
                            procMacro = {
                                enable = true,
                            },
                            lru = {
                                capacity = 256,
                            },
                        },
                    },
                },
            }
        end,
    },
}
