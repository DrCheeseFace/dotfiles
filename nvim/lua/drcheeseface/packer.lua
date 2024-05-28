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
        "pineapplegiant/spaceduck",
        config = function()
            vim.cmd("colorscheme spaceduck")
            vim.api.nvim_set_hl(0, "LineNr", { fg = "white"})
            vim.api.nvim_set_hl(0, "Comment", { fg = "grey"})
        end
    },
    -- transparent background
    "xiyaowong/nvim-transparent",
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
    --snippits and sugestions
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "rafamadriz/friendly-snippets",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "VonHeikemen/lsp-zero.nvim",
    --the goat treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {"nvim-lua/plenary.nvim"}
    },
    --quick file navifation
    "nvim-lua/plenary.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies= {{"nvim-lua/plenary.nvim"}}
    },
    --an undotree
    "mbbill/undotree",
    --vim git
    "tpope/vim-fugitive",
    --lsp and linterst
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    --hex editor
    "RaafatTurki/hex.nvim",
    --autopair brackets
    "windwp/nvim-autopairs",
    --surrouding text
    "echasnovski/mini.surround",
    -- word highlighting
    "echasnovski/mini.cursorword",
    --html auto tags
    "windwp/nvim-ts-autotag",
    --commenting
    "numToStr/Comment.nvim",
    --status bar
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    --horizontal highlighting when using 'f
    "jinh0/eyeliner.nvim",
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
