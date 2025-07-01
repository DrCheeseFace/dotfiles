require("drcheeseface.remap")
require("drcheeseface.set")
require("drcheeseface.packer")

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
        callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set({ "n", "i" }, '<C-i>', function() vim.lsp.buf.signature_help() end, opts)
        end
})

local function toggle_quickfix()
        local windows = vim.fn.getwininfo()
        for _, win in pairs(windows) do
                if win["quickfix"] == 1 then
                        vim.cmd.cclose()
                        return
                end
        end
        vim.cmd.copen()
end

vim.keymap.set('n', '[d', toggle_quickfix, { desc = "Toggle Quickfix Window" })
vim.keymap.set('n', '<leader>xx', function() vim.diagnostic.setqflist() end, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vd', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

vim.cmd [[
  augroup strdr4605
    autocmd FileType typescript,typescriptreact set makeprg=./node_modules/.bin/tsc\ \\\|\ sed\ 's/(\\(.*\\),\\(.*\\)):/:\\1:\\2:/'
  augroup END
]]
