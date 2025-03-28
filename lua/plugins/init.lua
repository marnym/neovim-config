vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.cmd [[highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline]]
vim.cmd [[highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline]]
vim.g.qs_max_chars = 150

-- Remove once mini.files supports this out of the box
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesActionRename',
    callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
    end,
})

return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        --- @module 'snacks'
        --- @type snacks.Config
        opts = {
            bigfile = { enabled = true },
            indent = {
                only_current = true,
                animate = { enabled = false },
            },
            input = { enabled = false },
            notifier = { enabled = true },
            statuscolumn = {
                refresh = 50,
            },
            styles = {
                notification = {
                    wo = { wrap = true },
                },
                input = {
                    keys = {
                        i_ctrl_w = { '<c-w>', '<c-w>', mode = 'i' },
                    },
                },
            },

        },
    },
    {
        'folke/trouble.nvim',
        keys = {
            {
                '<leader>q',
                function() require('trouble').open() end,
                desc =
                'Open trouble.nvim',
            },
            {
                'gp',
                function()
                    local trouble = require('trouble')
                    if trouble.is_open() then
                        trouble.previous { skip_groups = true, jump = true }
                    else
                        vim.diagnostic.goto_prev()
                    end
                end,
                desc = '[G]o to [P}revious diagnostic',
            },
            {
                'gn',
                function()
                    local trouble = require('trouble')
                    if trouble.is_open() then
                        trouble.next { skip_groups = true, jump = true }
                    else
                        vim.diagnostic.goto_next()
                    end
                end,
                desc =
                '[G]o to [N]ext diagnostic',
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            auto_preview = false,
            win_config = {
                border = 'rounded',
            },
        },
    },
    {
        'someone-stole-my-name/yaml-companion.nvim',
        lazy = true,
        dependencies = { 'nvim-lua/plenary.nvim' },
        -- config = function() require('telescope').load_extension('yaml_schema') end,
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
    },
    {
        'unblevable/quick-scope',
        keys = { 'f', 'F', 't', 'T' },
    },
    {
        'danymat/neogen',
        cmd = 'Neogen',
        opts = { snippet_engine = 'luasnip' },
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        },
        keys = {
            { '<Leader>n', function() vim.cmd [[Neotree toggle]] end },
        },
    },
    -- mini.nvim
    {
        'echasnovski/mini.surround',
        version = false,
        event = 'BufEnter',
        config = function() require('mini.surround').setup() end,
    },
    {
        'echasnovski/mini.files',
        version = false,
        config = function()
            require('mini.files').setup {
                mappings = {
                    go_in = 'L',
                    go_in_plus = 'l',
                },
            }
        end,
        keys = {
            { '-', function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end },
        },
    },
    {
        'echasnovski/mini.pairs',
        version = false,
        event = 'InsertEnter',
        config = function() require('mini.pairs').setup() end,
    },
}
