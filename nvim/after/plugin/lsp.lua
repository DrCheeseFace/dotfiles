local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities()
)
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

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
    "ts_ls",
    "gopls",
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
        }
      }
    end,
  }
})

require 'lspconfig'.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}


require("lspconfig").gopls.setup({
  settings = {
    gopls = {
      buildFlags = { "-tags=test failing_tests" },
    }
  },
})
