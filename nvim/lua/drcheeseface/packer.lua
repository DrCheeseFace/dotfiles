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
        "stevearc/oil.nvim",
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
                        "hrsh7th/nvim-cmp",
                        "hrsh7th/cmp-nvim-lsp",
                        "L3MON4D3/LuaSnip",
                        "saadparwaiz1/cmp_luasnip",
                        "hrsh7th/cmp-path",
                },
        },
        "j-hui/fidget.nvim",
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
        { "mfussenegger/nvim-dap", dependencies = { "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" } },
}

local opts = {}
require("lazy").setup(plugins, opts)
