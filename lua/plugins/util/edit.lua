vim.pack.add {
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/windwp/nvim-ts-autotag',
}

require('mini.surround').setup()
require('mini.pairs').setup()
