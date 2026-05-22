require("mini.surround").setup {}
require("fidget").setup({})
require("nvim-web-devicons").setup({})

vim.api.nvim_create_user_command('RemoveAnsi', function()
  vim.cmd([[%s/\v\e\[[0-9;]*[mK]//g]])
end, {})
