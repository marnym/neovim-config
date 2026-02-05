local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function vim_cmd(cmd)
    return function()
        return vim.cmd(cmd)
    end
end

-- move by line
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Use alt + hjkl to resize windows
keymap('n', '<M-j>', vim_cmd('resize -2'), opts)
keymap('n', '<M-k>', vim_cmd('resize +2'), opts)
keymap('n', '<M-h>', vim_cmd('vertical resize -2'), opts)
keymap('n', '<M-l>', vim_cmd('vertical resize +2'), opts)

keymap('i', 'jk', '<Esc>', opts)
keymap('i', 'kj', '<Esc>', opts)

-- SHIFT-TAB to de-tab
keymap('i', '<S-TAB>', '<C-d>', opts)

-- Better tabbing
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<C-s>', 'a<C-X><C-S>', opts)

-- bufdelete
keymap('n', '<leader>bd', vim_cmd('bwipeout!'), opts)

-- exit terminal mode
keymap('t', '<C-space>', '<C-\\><C-n>', opts)

-- spell
keymap('n', 'zp', '[s', opts)
keymap('n', 'zn', ']s', opts)

-- execute file
keymap('n', '<space>x', '<cmd>source %<CR>')
-- execute selected
keymap('v', '<space>x', ':lua<CR>')

keymap('n', 'gp',
    function() vim.diagnostic.jump { count = -1, float = true } end,
    { desc = '[G]o to [P]revious diagnostic' })
keymap('n', 'gn',
    function() vim.diagnostic.jump { count = 1, float = true } end,
    { desc = '[G]o to [N]ext diagnostic' })
