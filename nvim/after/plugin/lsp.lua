require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd" },
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = { border = "rounded" },
	}, bufnr)
end

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach,
})
vim.lsp.enable("clangd")

vim.lsp.config("ltex", {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		local status_ok, ltex_extra = pcall(require, "ltex_extra")
		if status_ok then
			ltex_extra.setup({
				load_langs = { "en-US" },
				init_check = true,
				path = ".ltex",
			})
		end
	end,
	settings = {
		ltex = {
			language = "en-US",
		},
	},
})
vim.lsp.enable("ltex")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-l>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = false,
	severity_sort = true,
})

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		lua = { "stylua" },
	},
})

vim.keymap.set("n", "<leader>xx", vim.diagnostic.setqflist, { desc = "open diagnostic quickfix list" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover" })
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "code actions" })
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "show diagnostic" })

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("position_encoding param is required") then
		return
	end
	notify(msg, ...)
end
