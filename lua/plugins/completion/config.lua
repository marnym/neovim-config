--- @module 'blink.cmp'
--- @type blink.cmp.Config
return {
    keymap = {
        preset = 'enter',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },

    sources = {
        default = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev' },
        providers = {
            lsp = { name = 'LSP', fallbacks = { 'buffer' } },
            lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', fallbacks = { 'lsp' } },
            path = { name = 'Path', score_offset = 2 },
            snippets = { name = 'Snippets', score_offset = -2 },
            buffer = { name = 'Buffer' },
            cmdline = {},
        },
    },

    snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
            if filter and filter.direction then
                return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
    },

    completion = {
        accept = { auto_brackets = { enabled = true } },
    },

    signature = { enabled = true },
}
