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

vim.keymap.set('n', '<leader>sh', function() require('fzf-lua').helptags() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n',
    '<leader>ff',
    -- default is copied from https://github.com/ibhagwan/fzf-lua/wiki/Options
    -- node_modules is added to it
    function() require('fzf-lua').files { fd_opts = '--color=never --type f --hidden --follow --exclude .git --exclude node_modules' } end,
    { desc = '[F]earch [F]iles' }
)
vim.keymap.set('n',
    '<leader>fg',
    -- default is copied from https://github.com/ibhagwan/fzf-lua/wiki/Options
    -- node_modules is added to it
    function() require('fzf-lua').live_grep { cmd = "rg --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!{.git,node_modules}/' -e" } end,
    { desc = '[F]ind using [G]rep' }
)
vim.keymap.set('n',
    '<leader>fp',
    function() require('fzf-lua').git_files() end,
    { desc = '[F]ind Git files' }
)
vim.keymap.set('n',
    '<space><space>',
    function() require('fzf-lua').buffers() end,
    { desc = 'Find buffers' }
)
vim.keymap.set('n',
    '<leader>ss',
    function() require('fzf-lua').lsp_workspace_symbols() end,
    { desc = '[S]earch [S]ymbols' }
)
