require("trouble").setup {
    auto_preview = false,
    auto_fold = true,
    use_diagnostics_signs = true
}
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("workspace_diagnostics") end)
