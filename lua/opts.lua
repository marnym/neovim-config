local set = vim.opt

-- set leader key
vim.api.nvim_set_keymap('', ' ', '', { noremap = true })
vim.g.mapleader = ' '

-- add all subdirectories to path
set.path = vim.o.path .. '**'

-- line numbers default
vim.wo.number = true
set.relativenumber = true

-- copy paste between vim and everything else
set.clipboard = 'unnamedplus'

-- enable mouse
set.mouse = 'a'

-- use spaces
set.expandtab = true
-- number of spaces
set.shiftwidth = 4
-- use the value of shiftwidth
set.softtabstop = -1
-- always use shiftwidth
set.smarttab = true

-- enable break indent
set.breakindent = true

-- save undo history
set.undofile = true

-- disable highlight on search
set.hlsearch = false

-- case insensitive search
set.ignorecase = true
set.smartcase = true

-- hide status, since status line shows it
set.showmode = false

-- keep signcolumn on
vim.wo.signcolumn = 'yes'

-- decrease update time
set.updatetime = 1000

-- decrease timeoutlen
set.timeoutlen = 500

-- set completeopt
set.completeopt = 'menuone,noselect'

set.termguicolors = true

-- so that `` is visible in markdown files
set.conceallevel = 0

-- Enable highlighting of the current line
set.cursorline = true

-- always keep 10 lines between cursor and top/bottom
set.scrolloff = 10

-- opt.smoothscroll = true

-- open splits to the right and bottom
set.splitright = true
set.splitbelow = true

-- listchars
set.list = true
set.listchars = {
    eol = '↲',
    tab = '» ',
    trail = '·',
}

set.inccommand = 'split'

-- filetypes
vim.filetype.add {
    pattern = {
        ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
        ['.*/roles/.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
        ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    },
}

vim.wo.colorcolumn = '120'
