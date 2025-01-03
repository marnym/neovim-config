return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        winopts = {
            width = 0.70,
            height = 0.75,
            preview = {
                layout = 'vertical',
                vertical = 'down:65%',
            },
        },
    },
    keys = {
        {
            '<leader>sh',
            function() require('fzf-lua').helptags() end,
            desc = '[S]earch [H]elp',
        },
        {
            '<leader>ff',
            -- default is copied from https://github.com/ibhagwan/fzf-lua/wiki/Options
            -- node_modules is added to it
            function() require('fzf-lua').files { fd_opts = '--color=never --type f --hidden --follow --exclude .git --exclude node_modules' } end,
            desc = '[F]ind [F]iles',
        },
        {
            '<leader>fg',
            -- default is copied from https://github.com/ibhagwan/fzf-lua/wiki/Options
            -- node_modules is added to it
            function() require('fzf-lua').live_grep { cmd = "rg --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!{.git,node_modules}/' -e" } end,
            desc = '[F]ind using [G]rep',
        },
        {
            '<leader>fp',
            function() require('fzf-lua').git_files() end,
            desc = '[F]ind Git files',
        },
        {
            '<space><space>',
            function() require('fzf-lua').buffers() end,
            desc = 'Find buffers',
        },
        {
            '<leader>ss',
            function() require('fzf-lua').lsp_workspace_symbols() end,
            desc = '[S]earch [S]ymbols',
        },
    },
}
