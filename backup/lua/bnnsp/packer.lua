vim.cmd [[packadd packer.nvim]]

vim.keymap.set('n', '<Leader>ps', ':PackerSync<CR>')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  -- use('karb94/neoscroll.nvim')

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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                          , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use({
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  })

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  })
end)
