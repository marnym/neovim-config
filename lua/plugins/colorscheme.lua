vim.pack.add {
    'https://github.com/sainnhe/gruvbox-material',
}

vim.o.background = 'dark'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

local group = vim.api.nvim_create_augroup('GruvboxMaterialCustom', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'gruvbox-material',
    group = group,
    callback = function()
        local palette = vim.api.nvim_call_function('gruvbox_material#get_palette',
            { vim.g.gruvbox_material_background, vim.g.gruvbox_material_foreground, vim.api.nvim_eval('{}') })

        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = palette.grey1[1] })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = palette.grey1[1] })

        vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { bg = 'NONE', fg = palette.aqua[1] })
    end,
})

vim.cmd('colorscheme gruvbox-material')

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
