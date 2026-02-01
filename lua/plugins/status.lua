vim.pack.add {
    'https://github.com/hoob3rt/lualine.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
}

local function attached_clients()
    local clients = vim.lsp.get_clients { bufnr = 0 }

    if #clients == 0 then
        return ''
    end

    local client_names = vim.iter(clients)
        :map(function(client)
            local name = client.name:gsub('language.server', 'ls')
            return name
        end)
        :totable()

    return '  LSP: ' .. table.concat(client_names, ', ')
end

local function yaml_schema()
    if vim.bo.filetype ~= 'yaml' then
        return ''
    end

    local schema_name = require('yaml-companion').get_buf_schema(0).result[1].name
    if schema_name ~= 'none' then
        return schema_name
    end
    return ''
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        section_separators = { left = '', right = '' },
        component_separators = '|',
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
            {
                'filetype',
                icon_only = false,
            },
            'encoding',
            { 'filename', path = 1 },
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
            -- TODO
            -- yaml_schema,
            attached_clients,
        },
        lualine_y = { 'progress' },
        lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
}
