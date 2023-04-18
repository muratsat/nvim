local opt = vim.opt

-- relative numbers
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.cursorline = false
-- color settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- ctrl-c, ctrl-v
opt.clipboard:append("unnamedplus")
opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.swapfile = false

opt.updatetime = 50
opt.scrolloff = 8

local function escape(str)
  -- Эти символы должны быть экранированы, если встречаются в langmap
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Наборы символов, введенных с зажатым шифтом
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
-- Наборы символов, введенных как есть
-- Здесь я не добавляю ',.' и 'бю', чтобы впоследствии не было рекурсивного вызова комманды
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
vim.opt.langmap = vim.fn.join({
  --  ; - разделитель, который не нужно экранировать
  --  |
  escape(ru_shift) .. ';' .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')
