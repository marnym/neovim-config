-- This is configured here instead of `after/lsp` because it requires blink.cmp.

local capabilities = require('blink.cmp').get_lsp_capabilities()
local clangd_capabilities = vim.tbl_extend('force', capabilities, { offsetEncoding = 'UTF-8' })

--- @type vim.lsp.Config
return {
    cmd = { 'clangd', '--background-index' },
    capabilities = clangd_capabilities,
}
