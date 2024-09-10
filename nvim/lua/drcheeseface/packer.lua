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
    --themes
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = { transparent = true },
    },
    --status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- github copilot
    "github/copilot.vim",
    --indent guidline highlighting
    "echasnovski/mini.indentscope",
    --file management with devicons
    "stevearc/oil.nvim",
    "kyazdani42/nvim-web-devicons",
    --TROUBLE TROUBLE TROUBLE
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons"
    },
    --lsp dude and snippits and sugestions
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
            "rafamadriz/friendly-snippets",
        },
    },
    --the goat treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    --quick file navifation
    "nvim-lua/plenary.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    --an undotree
    "mbbill/undotree",
    --context
    "romgrk/nvim-treesitter-context",
    --vim git
    "tpope/vim-fugitive",
    --surrouding text
    "echasnovski/mini.surround",
    --commenting
    "numToStr/Comment.nvim",
    --horizontal highlighting when using 'f
    "jinh0/eyeliner.nvim",
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
