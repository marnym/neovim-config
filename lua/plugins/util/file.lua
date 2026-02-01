vim.pack.add {
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3.*'),
    },
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>n', function() vim.cmd [[Neotree toggle]] end, { desc = '[N]eoTree toggle' })

require('neo-tree').setup {
    window = {
        position = 'right',
    },
}

vim.pack.add {
    'https://github.com/nvim-mini/mini.files',
}

require('mini.files').setup {
    mappings = {
        go_in = 'L',
        go_in_plus = 'l',
    },
}
vim.keymap.set('n', '-', function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end, { desc = 'Mini.files' })
