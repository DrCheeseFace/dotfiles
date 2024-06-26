-- Function to toggle between horizontal and vertical splits
function HoriSplit()
    local current_win = vim.api.nvim_get_current_win()
    local current_config = vim.api.nvim_win_get_config(current_win)

    -- Check if the current split is horizontal
    if current_config.relative == '' then
        -- If it is, change it to a vertical split
        vim.cmd('wincmd H')
    end
end

vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>l", ":w<CR>")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap('n', '<leader>ts', ':lua HoriSplit()<CR>', { noremap = true, silent = true })
