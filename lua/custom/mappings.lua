---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-g>"] = { "<cmd> LazyGit<CR>", "lazygit" },
    ["<leader>tt"] = {
      function ()
        require('base46').toggle_transparency()
      end, "toggle transparency"
    }
  },
  i = {
    ["<C-s>"] = { "<cmd> w<leader>tt <CR>", "save file" },
  },
  v = {
    [">"] = {">gv"},
    ["<"] = {"<gv"},
  },
  t = {
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "window left" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", "window right" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "window down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "window up" },
  },

}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>sf"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>sa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>sg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>sh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<C-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },
  },
}

M.gitsigns = {
  n = {
    -- Actions
    ["<leader>u"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>h"] = {
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      "Preview hunk",
    },
  },
}

M.tabufline = {
  plugin = true,

  i = {
  },

  n = {
    -- cycle through buffers
    ["<A-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<A-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- move buffer
    ["<A-.>"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(1)
      end,
      "move buffer right",
    },

    ["<A-,>"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(-1)
      end,
      "move buffer left",
    },

    -- close buffer + hide terminal buffer
    ["<A-w>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

M.nvterm = {
  plugin = true,

  n = {
    -- toggle in terminal mode
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  t = {
    -- toggle in terminal mode
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
}

-- more keybinds!

return M
