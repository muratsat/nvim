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


keymap.set('n', '<leader>t', ':FloatermToggle<CR>')
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>:FloatermToggle<CR>')

keymap.set('n', '<F7>', ':FloatermNew<CR>')
keymap.set('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>')
keymap.set('t', '<F9>', '<C-\\><C-n>:FloatermNext<CR>')


keymap.set('n', '<C-g>', ':LazyGit<CR>')

-- preview current hunk changes
keymap.set('n', '<leader>h', ':GitGutterPreviewHunk<CR>')
keymap.set('n', '<leader>u', ':GitGutterUndoHunk<CR>')

