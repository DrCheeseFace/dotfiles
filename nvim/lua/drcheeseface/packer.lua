-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  require('packer').startup(function(use)
	  use({ 'rose-pine/neovim', as = 'rose-pine', 
  		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	})

  end)
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {"ThePrimeagen/harpoon"}
  use {"mbbill/undotree"}
  use {"tpope/vim-fugitive"}
  use {"williamboman/mason.nvim"}
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
end)
