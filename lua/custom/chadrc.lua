---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
  },

  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = function()
      -- local modules = require "nvchad_ui.tabufline.modules"
      return {
         buttons = function()
           return ""
         end,
       }
    end,
  },
}

M.blankline = {
  show_current_context = false,
  show_current_context_start = false,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
