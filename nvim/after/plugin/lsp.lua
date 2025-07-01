local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

require("mason").setup(
        {
                ui = {
                        icons = {
                                package_installed = "✓",
                                package_pending = "➜",
                                package_uninstalled = "✗"
                        }
                }
        }
)

require("mason-lspconfig").setup({
        ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
        },
        handlers = {
                function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                                capabilities = capabilities,
                        }
                end,

                ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                                capabilities = capabilities,
                                settings = {
                                        Lua = {
                                                runtime = { version = "Lua 5.1" },
                                                diagnostics = {
                                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                                }
                                        },
                                        ["rust-analyzer"] = {
                                                -- THIS ISNT DEFAULT??????
                                                diagnostics = {
                                                        enable = true,
                                                }
                                        }
                                }
                        }
                end,
        }
})


require("lspconfig").arduino_language_server.setup({
        cmd = {
                "arduino-language-server",
                "-clangd", "~/.local/share/nvim/mason/bin/clangd",
                "-cli", "~/bin/arduino-cli",
                "-cli-config", "$~/.arduino15/arduino-cli.yaml",
                "-fqbn", "arduino:avr:uno"
        }
})
