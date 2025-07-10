return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.lsp.buf.hover { border = 'rounded' }
            vim.lsp.buf.signature_help { border = 'rounded' }

            vim.api.nvim_create_autocmd('LspAttach', {
                pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    if client.name == 'denols' then
                        local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'vtsls' }
                        for _, c in ipairs(clients) do
                            vim.lsp.stop_client(c.id, true)
                        end
                    elseif client.name == 'vtsls' and next(vim.lsp.get_clients { bufnr = bufnr, name = 'denols' }) then
                        vim.lsp.stop_client(client.id, true)
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

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config('*', {
                capabilities = capabilities,
                root_markers = { '.git' },
            })

            vim.lsp.config('ansiblels', {
                cmd = { 'npx', '@ansible/ansible-language-server', '--stdio' },
                filetypes = { 'yml', 'yaml', 'yml.ansible', 'yaml.ansible' },
            })

            local clangd_capabilities = vim.tbl_extend('force', capabilities, {
                offsetEncoding = 'utf-8',
            })
            vim.lsp.config('clangd', {
                cmd = { 'clangd', '--background-index' },
                capabilities = clangd_capabilities,
            })

            vim.lsp.config('cssls', {
                root_markers = { 'package.json', 'deno.json', '.git' },
            })

            vim.lsp.config('denols', {
                root_markers = { 'deno.json', 'deno.jsonc' },
                filetypes = { 'typescript, typescriptreact, typescript.tsx' },
                settings = {
                    deno = {
                        enable = true,
                        unstable = true,
                        suggest = {
                            imports = {
                                hosts = {
                                    ['https://deno.land'] = true,
                                },
                            },
                        },
                    },
                },
            })

            vim.lsp.config('gopls', {
                settings = {
                    gopls = {
                        experimentalPostfixCompletions = true,
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                        },
                        staticcheck = true,
                    },
                },
                init_options = {
                    usePlaceholders = true,
                },
            })

            vim.lsp.config('harper_ls', {
                root_markers = { '*.typ', '.git' },
                filetypes = { 'gitcommit', 'markdown', 'typst' },
            })

            vim.lsp.config('html', {
                root_markers = { 'package.json', 'deno.json', '.git' },
                filetypes = { 'html', 'templ', 'eta' },
            })

            local schemastore = require('schemastore')

            vim.lsp.config('jsonls', {
                settings = {
                    json = {
                        schemas = schemastore.json.schemas(),
                        validate = { enable = true },
                    },
                },
            })

            vim.lsp.config('ltex_ls', {
                cmd = { '/home/markus/dev/ltex-ls-plus/target/appassembler/bin/ltex-ls-plus' },
                filetypes = { 'typst' },
                settings = {
                    ltex = {
                        enabled = { 'typst' },
                        checkFrequency = 'save',
                        language = 'en-US',
                        sentenceCacheSize = 5000,
                    },
                },
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.lsp.config('nil_ls', {
                settings = {
                    ['nil'] = {
                        nix = {
                            flake = {
                                autoArchive = true,
                            },
                        },
                    },
                },
            })

            vim.lsp.config('superhtml', {
                root_markers = { 'package.json', 'deno.json', '.git' },
            })

            vim.lsp.config('tailwindcss', {
                cmd = { 'npx', '@tailwindcss/language-server', '--stdio' },
                filetypes = {
                    'astro',
                    'astro-markdown',
                    'ejs',
                    'eta',
                    'gohtml',
                    'gohtmltmpl',
                    'handlebars',
                    'hbs',
                    'htmlangular',
                    'css',
                    'less',
                    'postcss',
                    'sass',
                    'scss',
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                    'vue',
                    'svelte',
                    'templ',
                },
            })

            vim.lsp.config('tinymist', {
                root_markers = { 'main.typ' },
                settings = {
                    exportPdf = 'never',
                    systemFonts = true,
                    semanticTokens = 'disable',
                    compileStatus = 'disable',
                    dragAndDrop = 'disable',
                    renderDocs = 'disable',
                    previewFeature = 'disable',
                },
            })

            vim.lsp.config('vtsls', {
                settings = {
                    typescript = {
                        tsdk = './.yarn/sdks/typescript/lib',
                    },
                    vtsls = {
                        autoUseWorkspaceTsdk = true,
                        javascript = {
                            format = {
                                enable = false,
                            },
                        },
                        typescript = {
                            format = {
                                enable = false,
                            },
                        },
                    },
                },
            })

            local yaml_companion = require('yaml-companion')
            local yaml_cfg = yaml_companion.setup {
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = '',
                        },
                        schemas = schemastore.yaml.schemas(),
                    },
                },
            }
            vim.api.nvim_create_user_command('YamlSchema',
                function()
                    local fzf = require('fzf-lua')
                    fzf.register_ui_select()
                    yaml_companion.open_ui_select()
                    fzf.deregister_ui_select()
                end,
                {
                    desc = 'Select YAML schema',
                }
            )
            vim.lsp.config('yamlls', yaml_cfg)

            vim.lsp.config('zls', {
                cmd = { 'zls' },
                root_markers = { 'zls.json', 'build.zig', '.git' },
                filetypes = { 'zig', 'zir' },
            })

            vim.lsp.enable {
                'ansiblels',
                'basedpyright',
                'bashls',
                'clangd',
                'cssls',
                'denols',
                'gopls',
                'html',
                'jsonls',
                'lua_ls',
                'marksman',
                'nil_ls',
                'superhtml',
                'tailwindcss',
                'terraformls',
                'texlab',
                'tinymist',
                'vue_ls',
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
