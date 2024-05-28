require("trouble").setup {
    auto_preview = false,
    use_diagnostics_signs = true
}
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)

vim.keymap.set("n", "[d", function()
    require("trouble").next({skip_groups = true, jump = true});
end)

vim.keymap.set("n", "]d", function()
    require("trouble").previous({skip_groups = true, jump = true});
end)
