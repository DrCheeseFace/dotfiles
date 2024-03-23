local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search = vim.fn.input('Grep String > ')})
end)
vim.keymap.set('n', '<leader>fr', function()
    require('telescope.builtin').lsp_references({search = value})
end)
vim.keymap.set('n', '<leader>vd', function()
    require('telescope.builtin').diagnostics({ severity_bound = 0 })
end)
vim.keymap.set('n', '<leader>gf', function()
    require('telescope.builtin').live_grep({search = value,
    previewer = false,
    grep_open_files = true,
    layout_config = { width = 0.5, height = 0.5 }})
end)
