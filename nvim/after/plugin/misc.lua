require("mini.indentscope").setup()
require("mini.surround").setup {}
require("fidget").setup({})
require("dap-go").setup()

-- temp fix to use fukass prettier config shit cringe a h
vim.keymap.set("n", "<leader>gp", "<CMD>silent %!prettier --stdin-filepath %<CR>", { desc = "get pretty" })
