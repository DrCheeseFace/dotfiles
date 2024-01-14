-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	  use({ 'rose-pine/neovim', as = 'rose-pine', 
  		config = function()
	--		vim.cmd("colorscheme rose-pine")
		end
	})

	  use({ 'pineapplegiant/spaceduck', as = 'spaceduck', 
  		config = function()
			vim.cmd("colorscheme spaceduck")
		end
	})


  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'rafamadriz/friendly-snippets'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use {'VonHeikemen/lsp-zero.nvim'}
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {"ThePrimeagen/harpoon", 
      branch = "harpoon2", 
      requires = {{"nvim-lua/plenary.nvim"}}}
  use {"mbbill/undotree"}
  use {"tpope/vim-fugitive"}
  use {"williamboman/mason.nvim"}
  use 'williamboman/mason-lspconfig.nvim'
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  } 
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {'jinh0/eyeliner.nvim'}

  local lsp_zero = require('lsp-zero')

  lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({buffer = bufnr})
  end)

  -- see :help lsp-zero-guide:integrate-with-mason-nvim
  -- to learn how to use mason.nvim with lsp-zero
  require('mason').setup({})
  require('mason-lspconfig').setup({
      handlers = {
          lsp_zero.default_setup,
      }
  })
  if packer_bootstrap then
      require('packer').sync()
  end

end)
