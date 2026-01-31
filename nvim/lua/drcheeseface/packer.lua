local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--file management
	{
		"stevearc/oil.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	--lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"ray-x/lsp_signature.nvim",
		},
	},

	--format
	"stevearc/conform.nvim",
	"j-hui/fidget.nvim",
	--the goat treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--quick file navifation
	"nvim-lua/plenary.nvim",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	--an undotree
	"mbbill/undotree",
	--surrouding text
	"echasnovski/mini.surround",
	--markdown previewer
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = { "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" },
	},
	{
		"lervag/vimtex",
		dependencies = { "barreiroleo/ltex_extra.nvim" },
		lazy = false,
		tag = "v2.17",
		init = function()
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_automatic = 0
			vim.g.vimtex_compiler_enabled = 1
                        vim.g.vimtex_compiler_method = 'latexmk'
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				hooks = {},
				options = {
					"-shell-escape",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_syntax_conceal_disable = 1
			vim.g.vimtex_compiler_latexmk_engines = {
				_ = "-pdf",
			}
		end,
	},
	{
		"nvim-telescope/telescope-bibtex.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		init = function()
			vim.keymap.set("n", "<leader>bb", "<cmd>Telescope bibtex<CR>", { desc = "search bibtex" })
			require("telescope").load_extension("bibtex")
		end,
	},
}

local opts = {}
require("lazy").setup(plugins, opts)
