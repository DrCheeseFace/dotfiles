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

local function run_go_test()
  local dir = vim.fn.expand('%:p:h')
  local word = vim.fn.expand('<cword>')
  local test_command = string.format('go test -tags test -run ^%s$', word)
  print("running ->", test_command)
  vim.cmd(string.format('rightbelow vsplit | terminal bash -c "cd %s && %s"', dir, test_command))
end

vim.keymap.set("n", "<leader>gt", run_go_test)
