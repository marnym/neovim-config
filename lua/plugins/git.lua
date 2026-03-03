vim.pack.add {
    {
        src = 'https://github.com/lewis6991/gitsigns.nvim',
        version = vim.version.range('v2.*'),
    },
    'https://github.com/sindrets/diffview.nvim',
}

require('diffview').setup {
    view = {
        merge_tool = {
            layout = 'diff3_mixed',
        },
    },
}

vim.opt.diffopt = {
    'internal',
    'filler',
    'closeoff',
    'context:12',
    'algorithm:histogram',
    'linematch:200',
    'indent-heuristic',
}

local gs = require('gitsigns')

gs.setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        vim.keymap.set('n',
            'gsp',
            function() gs.nav_hunk('prev') end,
            { buffer = bufnr, desc = 'Go to [P]revious hunk' }
        )

        vim.keymap.set('n',
            'gsn',
            function() gs.nav_hunk('next') end,
            { buffer = bufnr, desc = 'Go to [N]ext hunk' }
        )

        vim.keymap.set('n',
            'gss',
            gs.preview_hunk,
            { buffer = bufnr, desc = 'Preview hunk' }
        )

        vim.keymap.set('n',
            'gsb',
            gs.toggle_current_line_blame,
            { buffer = bufnr, desc = 'Toggle line [B]lame' }
        )
    end,
}
