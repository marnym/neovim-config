local ts = 'nvim-treesitter'
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == ts and kind == 'update' then
            if not ev.data.active then
                vim.cmd.packadd(ts)
            end
            vim.cmd('TSUpdate')
        end
    end,
})

vim.pack.add {
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'main',
    },
}

require(ts).install {
    'bash',
    'c',
    'dockerfile',
    'fish',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'gomod',
    'gosum',
    'html',
    'javascript',
    'json',
    'just',
    'kotlin',
    'lua',
    'make',
    'markdown',
    'nix',
    'python',
    'rust',
    'scala',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'typst',
    'vim',
    'yaml',
    'zig',
}

vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        local ft = ev.match
        local lang = vim.treesitter.language.get_lang(ft)
        if vim.treesitter.language.add(lang) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.treesitter.start()
        end
    end,
})
