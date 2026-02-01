-- Need to ensure that LazyDev is installed
require('plugins.lsp.neovim')

vim.pack.add {
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('v1.*'),
    },
    'https://github.com/rafamadriz/friendly-snippets',
    {
        src = 'https://github.com/L3MON4D3/LuaSnip',
        version = vim.version.range('v2.*'),
    },
}

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').lazy_load { paths = './snippets' }

require('blink.cmp').setup {
    keymap = {
        preset = 'enter',
        ['<C-k>'] = { 'select_prev' },
        ['<C-j>'] = { 'select_next' },
        ['<C-l>'] = { 'snippet_forward' },
        ['<C-h>'] = { 'snippet_backward' },
        ['<Tab>'] = {},
        ['<S-Tab>'] = {},
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
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
        accept = { auto_brackets = { enabled = false } },
        menu = { min_width = 30 },
    },
    signature = { enabled = true },
    cmdline = { enabled = false },
}
