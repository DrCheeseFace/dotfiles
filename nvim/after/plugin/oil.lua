require("oil").setup({
  float = {
    max_width = 0.5,
    max_height = 0.5,
  }
})
vim.keymap.set("n", "<leader>pv", "<CMD>Oil --float <CR>", { desc = "Open parent directory" })
