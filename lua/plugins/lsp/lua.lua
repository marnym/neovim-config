local M = {}

M.setup = function(lsp, capabilities, on_attach)
    lsp.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim', 'require' },
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
    }
end

return M
