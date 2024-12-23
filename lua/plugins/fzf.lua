return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '<leader>sh',
            function() require('fzf-lua').helptags() end,
            desc = '[S]earch [H]elp',
        },
        {
            '<leader>ff',
            function() require('fzf-lua').files { cmd = 'fd --type f --exclude node_modules' } end,
            desc = '[F]ind [F]iles',
        },
        {
            '<leader>fg',
            function() require('fzf-lua').live_grep { cmd = "rg --color=always --smart-case -g '!{.git,node_modules}/'" } end,
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
