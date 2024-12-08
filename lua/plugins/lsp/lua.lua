local M = {}

M.setup = function(lsp, capabilities)
    lsp.lua_ls.setup {
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
