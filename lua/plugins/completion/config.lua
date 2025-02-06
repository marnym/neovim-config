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
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        providers = {
            lsp = { name = 'LSP', fallbacks = { 'buffer' } },
            lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', fallbacks = { 'lsp' } },
            path = { name = 'Path', score_offset = 2 },
            snippets = { name = 'Snippets', score_offset = -2 },
            buffer = {
                name = 'Buffer',
                transform_items = function(a, items)
                    if vim.bo[a.bufnr].filetype ~= 'typst' then
                        return items
                    end

                    -- keep case of first char
                    local keyword = a.get_keyword()
                    local correct, case
                    if keyword:match('^%l') then
                        correct = '^%u%l+$'
                        case = string.lower
                    elseif keyword:match('^%u') then
                        correct = '^%l+$'
                        case = string.upper
                    else
                        return items
                    end

                    -- avoid duplicates from the corrections
                    local seen = {}
                    local out = {}
                    for _, item in ipairs(items) do
                        local raw = item.insertText
                        if raw and raw:match(correct) then
                            local text = case(raw:sub(1, 1)) .. raw:sub(2)
                            item.insertText = text
                            item.label = text
                        end
                        if not seen[item.insertText] then
                            seen[item.insertText] = true
                            table.insert(out, item)
                        end
                    end
                    return out
                end,
            },
        },
    },

    cmdline = {
        enabled = false,
    },

    snippets = {
        preset = 'luasnip',
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
