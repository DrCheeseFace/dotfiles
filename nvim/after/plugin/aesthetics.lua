require("lualine").setup({
    options = {
        section_separators = { "", "" },
        component_separators = { "", "" },
    },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        }
    },
})

vim.cmd("colorscheme kanagawa")
vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
vim.api.nvim_set_hl(0, "Comment", { fg = "grey" })
