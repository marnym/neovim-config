-- set leader key
vim.api.nvim_set_keymap('', ' ', '', { noremap = true })
vim.g.mapleader = ' '

-- line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- copy paste between vim and everything else
vim.o.clipboard = 'unnamedplus'

-- enable mouse
vim.o.mouse = 'a'

-- use spaces
vim.o.expandtab = true
-- number of spaces
vim.o.shiftwidth = 4
-- use the value of shiftwidth
vim.o.softtabstop = -1
-- always use shiftwidth
vim.o.smarttab = true

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true
vim.o.undolevels = 10000

-- disable highlight on search
vim.o.hlsearch = false

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- hide status, since status line shows it
vim.o.showmode = false

-- keep signcolumn on
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 200

-- decrease timeoutlen
vim.o.timeoutlen = 500

-- set completeopt
vim.o.completeopt = 'menuone,noselect,popup,fuzzy'

vim.o.termguicolors = true

-- so that `` is visible in markdown files
vim.o.conceallevel = 0

-- Enable highlighting of the current line
vim.o.cursorline = true

-- always keep 10 lines between cursor and top/bottom
vim.o.scrolloff = 10

-- opt.smoothscroll = true

-- open splits to the right and bottom
vim.o.splitright = true
vim.o.splitbelow = true

-- listchars
vim.o.list = true
vim.opt.listchars = {
    eol = '↲',
    tab = '▏ ',
    trail = '·',
    extends = '»',
    precedes = '«',
}

vim.o.inccommand = 'split'

-- filetypes
vim.filetype.add {
    pattern = {
        ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
        ['.*/roles/.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
        ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    },
}

vim.wo.colorcolumn = '120'

vim.diagnostic.config {
    virtual_text = { current_line = true },
    severity_sort = true,
}

vim.g.markdown_fenced_languages = {
    'ts=typescript',
}

vim.g.netrw_banner = 0

-- allows setting project specific settings
vim.o.exrc = true
