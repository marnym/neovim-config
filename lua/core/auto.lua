-- Some useful autocommands.
-- See: https://gist.github.com/smnatale/692ac4f256d5f19fbcbb78fe32c87604

-- open help in vertical split
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    command = 'wincmd L',
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd('VimResized', {
    command = 'wincmd =',
})

-- syntax highlighting for dotenv files
vim.api.nvim_create_autocmd('BufRead', {
    group = vim.api.nvim_create_augroup('dotenv_ft', { clear = true }),
    pattern = { '.env', '.env.*' },
    callback = function()
        vim.bo.filetype = 'dosini'
    end,
})

-- show cursorline only in active window enable
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    group = vim.api.nvim_create_augroup('active_cursorline', { clear = true }),
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

-- show cursorline only in active window disable
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    group = 'active_cursorline',
    callback = function()
        vim.opt_local.cursorline = false
    end,
})
