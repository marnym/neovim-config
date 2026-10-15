-- This is configured here instead of `after/lsp` because it requires blink.cmp.

local capabilities = require('blink.cmp').get_lsp_capabilities()

--- @type vim.lsp.Config
return {
    capabilities = vim.tbl_extend(
        'force',
        capabilities,
        {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        }
    ),
}
