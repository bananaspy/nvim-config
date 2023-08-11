vim.cmd [[packadd packer.nvim]]

vim.keymap.set('n', '<Leader>ps', ':PackerSync<CR>')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('karb94/neoscroll.nvim')

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
          }
      end
  })

  use({
	  'windwp/nvim-autopairs',
	  config = function() require('nvim-autopairs').setup() end
  })

  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                          , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })

  use({
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
  })

  use ({
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
                  -- LSP Support
                  {'neovim/nvim-lspconfig'},             -- Required
                  {'williamboman/mason.nvim'},           -- Optional
                  {'williamboman/mason-lspconfig.nvim'}, -- Optional

                  -- Autocompletion
                  {'hrsh7th/nvim-cmp'},     -- Required
                  {'hrsh7th/cmp-nvim-lsp'}, -- Required
                  {'L3MON4D3/LuaSnip'},     -- Required
                  {'rafamadriz/friendly-snippets'},
	  }
  })

end)

