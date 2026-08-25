vim.pack.add {
    'https://github.com/sainnhe/everforest',
}

vim.o.background = 'dark'
vim.g.everforest_enable_italic = true
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_transparent_background = 1
vim.g.everforest_diagnostic_virtual_text = ''

-- everforest overrides
vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('custom_highlights_everforest', {}),
    pattern = 'everforest',
    callback = function()
        local config = vim.fn['everforest#get_configuration']()
        local palette = vim.fn['everforest#get_palette'](config.background, config.colors_override)
        local set_hl = vim.fn['everforest#highlight']

        -- highlight comments with orange
        set_hl('Comment', palette.orange, palette.none)
    end,
})

vim.cmd('colorscheme everforest')

---@param msg string
local function log(msg)
    vim.notify('[color-scheme]' .. msg, vim.log.levels.INFO)
end

---@return 'dark' | 'light' | nil
local function read_scheme()
    local is_linux = vim.uv.os_uname().sysname == 'Linux'
    if not is_linux then
        return
    end

    local res = vim.system({ 'dconf', 'read', '/org/gnome/desktop/interface/color-scheme' }, { text = true }):wait(1000)
    local mode = res.stdout
    if not mode then
        return log('failed to get color scheme')
    end

    if mode:match('dark') then
        return 'dark'
    elseif mode:match('light') then
        return 'light'
    else
        log(string.format('unknown color mode: %q', mode))
    end
end


vim.api.nvim_create_autocmd('Signal', {
    pattern = 'SIGUSR1',
    callback = function()
        local scheme = read_scheme()
        if scheme then
            vim.opt.background = scheme
        end
    end,
})

local scheme = read_scheme()
if scheme then
    vim.opt.background = scheme
end
