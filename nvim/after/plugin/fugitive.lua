-- toggle git fugitive
vim.keymap.set("n", "<leader>gs",
    function()
        for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'filetype') == 'fugitive' then
                return
                    vim.api.nvim_win_close(win, true)
            end
        end
        vim.cmd('Git')
    end)
