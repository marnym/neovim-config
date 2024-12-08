local M = {}

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


M.setup = function(lsp, capabilities)
    vim.g.markdown_fenced_languages = {
        'ts=typescript',
    }

    lsp.denols.setup {
        capabilities = capabilities,
        root_dir = lsp.util.root_pattern('deno.json', 'deno.jsonc'),
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
    }

    require('lspconfig.configs').vtsls = require('vtsls').lspconfig
    lsp.vtsls.setup {
        capabilities = capabilities,
        cmd = { 'npx', '--yes', '@vtsls/language-server', '--stdio' }, -- don't like this, but packaging pnpm packages in Nix is not currently nice
    }
end

return M
