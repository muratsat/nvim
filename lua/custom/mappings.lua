---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>x"] = {"<cmd> !chmod +x %<CR>", "make executable"},
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-g>"] = { "<cmd> LazyGit<CR>", "lazygit" },
    ["<leader>tw"] = {
      function ()
        vim.wo.wrap = not vim.wo.wrap
      end, "toggle wrap"
    },
    ["<leader>tt"] = {
      function ()
        require('base46').toggle_transparency()
      end, "toggle transparency"
    },
    ["<A-u>"] = {
      "<cmd> UndotreeToggle<CR>",
      "toggle undo tree",
    }
  },
  i = {
    ["<C-BS>"] = { "<C-W>"},
    ["<C-H>"] = { "<C-W>"},
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
  vim.keymap.set("i", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

M.nvterm = {
  plugin = true,

  n = {
    ["<C-A-n>"] = {
      function()
        local ft_cmds = {
          python = "clear && time python3 " .. vim.fn.expand "%",
          cpp = string.format("clear && g++ -o %s %s -g && time ./%s", vim.fn.expand('%:t:r'), vim.fn.expand('%'), vim.fn.expand('%:t:r')),
          javascript = "node " .. vim.fn.expand "%",
          lua = "lua " .. vim.fn.expand "%",
          sh = "bash " .. vim.fn.expand "%",
        }
        vim.cmd [[w]]
        require("nvterm.terminal").send(ft_cmds[vim.bo.filetype], "horizontal")
      end,
      "run current file in terminal",
    },
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
--
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

return M
