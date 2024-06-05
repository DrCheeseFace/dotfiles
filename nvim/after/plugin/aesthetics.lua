require("lualine").setup({
    options = {
        theme = "spaceduck",
    },
})

vim.cmd("colorscheme spaceduck")
vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
vim.api.nvim_set_hl(0, "Comment", { fg = "grey" })
