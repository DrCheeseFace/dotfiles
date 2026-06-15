vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = false,
	severity_sort = true,
})

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		lua = { "stylua" },
		javascript = { "deno_fmt" },
		typescript = { "deno_fmt" },
	},
})

local cmp = require("cmp")
cmp.setup({
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
	sources = {
		{ name = "tags" },
		{ name = "buffer" },
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				tags = "[Tag]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

local make_ns = vim.api.nvim_create_namespace("manual_make")

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = "make",
	callback = function()
		vim.schedule(function()
			local diagnostics = vim.diagnostic.fromqflist(vim.fn.getqflist())
			vim.diagnostic.set(make_ns, vim.api.nvim_get_current_buf(), diagnostics)
		end)
	end,
})
