vim.g.mapleader = " "
local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")


-- open terminal in the bottom like int VSCode
keymap.set('n', '<C-t>', ':FloatermToggle<CR>')
