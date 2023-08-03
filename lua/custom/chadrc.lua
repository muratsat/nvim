---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },
  transparency = true,

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    overriden_modules = function(modules)
      modules[8] = (function ()
          if rawget(vim, "lsp") then
            for _, client in ipairs(vim.lsp.get_active_clients()) do
              if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                return (vim.o.columns > 100 and "%#St_LspStatus#" .. client.name .. " ") or "   LSP "
              end
            end
          end
      end)()
      modules[9] = (function ()
          return ""
      end)()
      modules[10] = (function ()
          return "%3l:%-2c"
      end)()
    end,
  },

  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = function(modules)
      -- local modules = require "nvchad_ui.tabufline.modules"
      table.remove(modules, 4)
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
