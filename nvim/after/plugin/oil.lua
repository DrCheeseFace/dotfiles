require("oil").setup({
        float = {
                max_width = 50,
                max_height = 50,
        },
        view_options = {
                show_hidden = true
        }
})
vim.keymap.set("n", "<leader>pv", "<CMD>Oil --float <CR>", { desc = "Open parent directory" })
