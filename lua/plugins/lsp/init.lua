-- Most LSPs should be configured here. Some LSPs are configured in separate files if they need additional plugins.

require('plugins.lsp.json')
require('plugins.lsp.metals')
require('plugins.lsp.neovim')
require('plugins.lsp.rust')
require('plugins.lsp.yaml')

vim.pack.add {
    {
        src = 'https://github.com/neovim/nvim-lspconfig',
        version = vim.version.range('v2.*'),
    },
}

vim.lsp.buf.hover { border = 'rounded' }
vim.lsp.buf.signature_help { border = 'rounded' }

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
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
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

vim.lsp.config('kotlin_lsp', {
    cmd = { '/home/markus/Downloads/kotlin-lsp/kotlin-lsp.sh', '--stdio' },
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

vim.lsp.config('zls', {
    settings = {
        semantic_tokens = 'partial',
    },
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
    'jsonls',
    'julials',
    'kotlin_lsp',
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
