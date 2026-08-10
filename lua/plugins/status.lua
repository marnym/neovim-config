vim.pack.add {
    'https://github.com/nvim-mini/mini.statusline',
}

local function lsp()
    if MiniStatusline.is_truncated(75) then return '' end

    local attached = vim.lsp.get_clients {
        bufnr = vim.api.nvim_get_current_buf(),
    }
    if #attached == 0 then return '' end

    local names = {}
    for _, client in ipairs(attached) do
        table.insert(names, client.name)
    end

    local icon = '󰰎'
    return icon .. ' ' .. table.concat(names, ' ')
end

vim.o.showmode = false
require('mini.statusline').setup {
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git           = MiniStatusline.section_git { trunc_width = 40 }
            local diff          = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics   = MiniStatusline.section_diagnostics { trunc_width = 75 }

            local filename      = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo      = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location      = MiniStatusline.section_location { trunc_width = 75 }
            local search        = MiniStatusline.section_searchcount { trunc_width = 75 }

            return MiniStatusline.combine_groups {
                { hl = mode_hl,                 strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp() } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { search, location } },
            }
        end,
    },
}
