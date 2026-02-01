vim.pack.add {
    'https://github.com/marnym/typst-watch.nvim',
}

require('typst-watch').setup {
    preview_cmd = { 'zathura' },
}
