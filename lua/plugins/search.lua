vim.pack.add {
    'https://github.com/nvim-mini/mini.pick',
    -- For additional pickers.
    'https://github.com/nvim-mini/mini.extra',
}

--- Centers window on screen
--- See: https://nvim-mini.org/mini.nvim/doc/mini-pick.html#minipick-examples-differentwindowstyles
local function win_config()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)

    return {
        border = 'rounded',
        anchor = 'NW',
        height = height,
        width  = width,
        row    = math.floor(0.5 * (vim.o.lines - height)),
        col    = math.floor(0.5 * (vim.o.columns - width)),
    }
end

require('mini.pick').setup {
    mappings = {
        choose_marked = '<C-CR>',

        move_down = '<C-j>',
        move_up = '<C-k>',

        -- Default mapping is <C-u>, which I want to scroll_up.
        delete_left = '',

        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
    },

    window = {
        config = win_config,
    },
}
require('mini.extra').setup()

vim.keymap.set('n',
    '<leader>h',
    MiniPick.builtin.help,
    { desc = 'Search [H]elp' }
)
vim.keymap.set('n',
    '<leader>f',
    MiniPick.builtin.files,
    { desc = 'Search [F]iles' }
)
vim.keymap.set('n',
    '<leader>g',
    MiniPick.builtin.grep_live,
    { desc = 'Search using [G]rep' }
)
vim.keymap.set('n',
    '<leader>p',
    MiniExtra.pickers.git_files,
    { desc = 'Search Git files' }
)
vim.keymap.set('n',
    '<leader><space>',
    MiniPick.builtin.buffers,
    { desc = 'Find buffers' }
)
vim.keymap.set('n',
    '<leader>s',
    function() MiniExtra.pickers.lsp { scope = 'workspace_symbol_live' } end,
    { desc = 'Search [S]ymbols' }
)
