local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      -- code actions
      {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
      },
      -- lightbulb
      {
        "kosayoda/nvim-lightbulb",
        config = function()
          require('nvim-lightbulb').setup({ autocmd = { enabled = true }})
        end,
        event = "CursorHold",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = false,
      show_current_context_start = false,
    }
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- github copilot
  {
    'github/copilot.vim',
    lazy = false,
  },

  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- undo tree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
