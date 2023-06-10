local cmp = require "cmp"
local cmp_ui = require("core.utils").load_config().ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local find_color = function(text)
  local _, _, r, g, b = string.find(text, "^rgb%((%d+), (%d+), (%d+)")
  local color = nil
  if r then
    color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
  else
    color = string.match(text, "#(%x%x%x%x%x%x)")
  end
  if not color then
    color = string.match(text, "#(%x%x%x)")
  end
  return color
end

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = function(entry, item)
    local icons = require("nvchad_ui.icons").lspkind
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    if item.kind == "Color" and entry.completion_item.documentation then
      local color = find_color(entry.completion_item.documentation)
      if color then
        local group = "Tw_" .. color
        if vim.fn.hlID(group) < 1 then
          vim.api.nvim_set_hl(0, group, { bg = "#" .. color })
        end
        item.kind = "  "
        item.kind_hl_group = group
        return item
      end
    end

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
    end

    return item
  end,
}

local mappings = {
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  },
  ["<C-l>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif require("luasnip").expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<C-h>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif require("luasnip").jumpable(-1) then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}

local override_options = function(opts)
  opts.formatting = formatting_style
  opts.mapping = mappings
  return opts
end

return override_options
