local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- paccage manager
  use 'wbthomason/packer.nvim'

  -- appearance
  use 'navarasu/onedark.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  -- syntax highligh
  use 'nvim-treesitter/nvim-treesitter'

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- integrated terminal
  use 'voldikss/vim-floaterm'

  -- commenting and autobrackets
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }

  }

  -- Additional lua configuration, makes nvim stuff amazing!
  use 'folke/neodev.nvim'

  -- github copilot
  use 'github/copilot.vim'

  -- git integration and hunk previews
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'

  use 'mbbill/undotree'
end)
