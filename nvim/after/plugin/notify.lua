require('notify').setup({
    background_colour = "#000000",
})
--dismiss notifications
vim.keymap.set("n", "<leader>cn", function() require('notify').dismiss({ silent = true, pending = true}) end)
