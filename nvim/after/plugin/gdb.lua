local bin_locations = vim.fn.stdpath("data") .. "/mason/bin/"

local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({})
require("dapui").setup()
require("nvim-dap-virtual-text").setup({})

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

vim.keymap.set("n", "<leader>?", function()
        require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<leader>gc", dap.continue)
vim.keymap.set("n", "<leader>gn", dap.step_over)
vim.keymap.set("n", "<leader>go", dap.step_out)
vim.keymap.set("n", "<leader>gl", dap.step_back)
vim.keymap.set("n", "<leader>gr", dap.restart)


dap.listeners.before.attach.dapui_config = function()
        dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
        dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
end

dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        host = "127.0.0.1",
        executable = {
                command = bin_locations .. "codelldb",
                args = { "--port", "${port}" },
        },
}

dap.configurations.cpp = {
        {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                runInTerminal = false,
        },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup({
        layouts = {
                {
                        elements = {
                                { id = "scopes",  size = 0.50 },
                                { id = "watches", size = 0.50 },
                        },
                        position = "left",
                        size = 50,
                },
                {
                        elements = {
                                { id = "stacks",      size = 0.5 },
                                { id = "breakpoints", size = 0.5 },
                        },
                        position = "bottom",
                        size = 10,
                },
        },
})
