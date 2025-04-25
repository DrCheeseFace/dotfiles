local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  local search = vim.fn.input('Grep String > ')
  if search ~= '' then
    builtin.grep_string({ search = search })
  end
end)
vim.keymap.set('n', '<leader>fr', function()
  require('telescope.builtin').lsp_references({})
end)
vim.keymap.set('n', '<leader>gf', function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    previewer = false,
    layout_config = { width = 0.8, height = 0.5 }
  })
end)
