return {
    keymap = { preset = 'default' },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },

    sources = {
        completion = {
            enabled_providers = { 'lsp', 'path', 'luasnip', 'buffer' },
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

    completion = { accept = { auto_brackets = { enabled = true } } },

    signature = { enabled = true }
}