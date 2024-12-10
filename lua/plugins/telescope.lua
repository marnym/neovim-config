return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-j>'] = 'move_selection_next',
                        ['<C-k>'] = 'move_selection_previous',
                    },
                },
                file_ignore_patterns = {
                    'node_modules/',
                },
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = { mirror = true, prompt_position = 'top', width = 0.75, height = 0.50 },
                },
                borderchars = {
                    { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                    prompt = { '─', '│', ' ', '│', '╭', '╮', '│', '│' },
                    results = { '─', '│', '─', '│', '├', '┤', '╯', '╰' },
                    preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                },
                previewer = true,
                prompt_title = false,
            },
            extensions = {
                fzf = {},
            },
        }
    end,
    keys = {
        { '<leader><space>', function() require('telescope.builtin').buffers() end, desc = '[ ] Find existing buffers' },
        {
            '<leader>fp',
            function() require('telescope.builtin').git_files() end,
            desc = '[F]ind [P]roject files',
        },
        {
            '<leader>ff',
            function() require('telescope.builtin').find_files() end,
            desc = '[F]ind [F]iles',
        },
        {
            '<leader>sw',
            function() require('telescope.builtin').grep_string() end,
            desc = '[S]earch current [W]ord',
        },
        {
            '<leader>fg',
            function() require('telescope.builtin').live_grep() end,
            desc = '[F]ind by [G]rep',
        },
        {
            '<leader>sh',
            function() require('telescope.builtin').help_tags() end,
            desc = '[S]earch [H]elp',
        },
        {
            '<leader>ss',
            function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end,
            desc = '[S]earch [S]ymbols',
        },
        {
            '<leader>sd',
            function() require('telescope.builtin').diagnostics() end,
            desc = '[S]earch [D]iagnostics',
        },
        {
            '<leader>ys',
            function() require('telescope').extensions.yaml_schema.yaml_schema() end,
            desc = '[Y]aml [S]chema',
        },
    },
}
