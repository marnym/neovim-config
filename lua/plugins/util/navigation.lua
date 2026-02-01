vim.pack.add {
    'https://github.com/otavioschwanck/arrow.nvim',
}

require('arrow').setup {
    show_icons = true,
    leader_key = 'ö', -- Recommended to be a single key
}

vim.pack.add {
    'https://github.com/unblevable/quick-scope',
}

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.qs_max_chars = 150
vim.cmd [[highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline]]
vim.cmd [[highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline]]
