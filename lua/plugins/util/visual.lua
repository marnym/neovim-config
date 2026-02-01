vim.pack.add {
    'https://github.com/nvim-mini/mini.indentscope',
}

local indentscope = require('mini.indentscope')
indentscope.setup {
    draw = {
        delay = 20,
        animation = indentscope.gen_animation.none(),
    },
    mappings = {
        object_scope = '',
        object_scope_with_border = '',
        goto_top = '',
        goto_bottom = '',
    },
}
