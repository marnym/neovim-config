vim.pack.add {
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-tree/nvim-web-devicons',
}

require('fzf-lua').setup {
    winopts = {
        width = 0.70,
        height = 0.75,
        preview = {
            layout = 'vertical',
            vertical = 'down:65%',
        },
    },
}

vim.keymap.set('n', '<leader>h', function() require('fzf-lua').helptags() end, { desc = 'Search [H]elp' })
vim.keymap.set('n',
    '<leader>f',
    -- default is copied from https://github.com/ibhagwan/fzf-lua/wiki/Options
    -- node_modules is added to it
    function() require('fzf-lua').files { fd_opts = '--color=never --type f --hidden --follow --exclude .git --exclude node_modules' } end,
    { desc = 'Search [F]iles' }
)
vim.keymap.set('n',
    '<leader>g',
    -- default is copied from https://github.com/ibhagwan/fzf-lua/wiki/Options
    -- node_modules is added to it
    function() require('fzf-lua').live_grep { cmd = "rg --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!{.git,node_modules}/' -e" } end,
    { desc = 'Search using [G]rep' }
)
vim.keymap.set('n',
    '<leader>p',
    function() require('fzf-lua').git_files() end,
    { desc = 'Search Git files' }
)
vim.keymap.set('n',
    '<leader><space>',
    function() require('fzf-lua').buffers() end,
    { desc = 'Find buffers' }
)
vim.keymap.set('n',
    '<leader>s',
    function() require('fzf-lua').lsp_workspace_symbols() end,
    { desc = 'Search [S]ymbols' }
)
