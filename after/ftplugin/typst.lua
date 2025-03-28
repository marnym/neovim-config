vim.bo.commentstring = '// %s'

vim.bo.spelllang = 'en_us'
vim.o.spell = true

vim.bo.shiftwidth = 2

vim.keymap.set('n', '<leader>w', function()
        local tw = require('typst-watch')
        tw.watch(vim.fn.expand('%:p'))
        tw.open_preview(nil)
    end,
    { noremap = true, desc = 'Start Typst [W]atch and preview' })
