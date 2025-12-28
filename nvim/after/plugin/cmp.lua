local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
        snippet = {
                expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-l>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
        }, {
                { name = 'path' },
        })
})

vim.diagnostic.config({
        update_in_insert = true,
        float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
        },
})
