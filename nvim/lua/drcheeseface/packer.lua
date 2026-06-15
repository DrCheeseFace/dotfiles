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
	--cmp ctags cscope
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"quangnguyen30192/cmp-nvim-tags",
	{
		"dhananjaylatkar/cscope_maps.nvim",
		opts = {
			disable_maps = false,
			skip_input_prompt = false,
			cscope = {
				db_file = "./cscope.out",
				exec = "cscope",
				picker = "telescope",
				skip_picker_for_single_result = true,
			},
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
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--quick file navifation
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
}

local opts = {}
require("lazy").setup(plugins, opts)
