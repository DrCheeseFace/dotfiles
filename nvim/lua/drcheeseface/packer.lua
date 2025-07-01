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
  --indent guidline highlighting
  "echasnovski/mini.indentscope",
  --file management with devicons
  "stevearc/oil.nvim",
  "kyazdani42/nvim-web-devicons",
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
  -- vim git (currently deactivated cuz bombaclart wsl and windows no like eachother)
  "tpope/vim-fugitive",
  --surrouding text
  "echasnovski/mini.surround",
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
  -- go shizz
  "charlespascoe/vim-go-syntax",
  -- TROUBLE TROUBLE TROUBLE
  -- "folke/trouble.nvim"
  -- tree sitter context
  -- "nvim-treesitter/nvim-treesitter-context"
  -- TEMP GOOFY SCREENKEY SHIZZ
  "sakhnik/nvim-gdb",
}

local opts = {}
require("lazy").setup(plugins, opts)
