---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    overriden_modules = function()
      return {
        cursor_position = function()
          return "%3l:%-2c"
        end,
        cwd = function ()
          return ""
        end,
        LSP_status = function()
          if rawget(vim, "lsp") then
            for _, client in ipairs(vim.lsp.get_active_clients()) do
              if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                return (vim.o.columns > 100 and "%#St_LspStatus#" ..  client.name .. " ") or "   LSP "
              end
            end
          end
        end
      }
    end,
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
