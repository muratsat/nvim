vim.g.mapleader = " "
local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set('i', '<C-H>', ' <Esc>dbi')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")      -- increment
keymap.set("n", "<leader>-", "<C-x>")      -- decrement

keymap.set("n", "<leader>nh", ":nohl<CR>") -- no highlight

-- move selected block one indent left/right
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")


-- Terminal --
keymap.set('n', '<leader>t', ':FloatermToggle<CR>')
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>:FloatermToggle<CR>')
keymap.set('t', '<leader><Esc>', '<C-\\><C-n><CR>')

keymap.set('n', '<F7>', ':FloatermNew<CR>')
keymap.set('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>')
keymap.set('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>')
keymap.set('t', '<F9>', '<C-\\><C-n>:FloatermNext<CR>')


-- Git mapppings --
keymap.set('n', '<C-g>', ':LazyGit<CR>')

-- preview current hunk changes
keymap.set('n', '<leader>h', ':Gitsigns preview_hunk_inline<CR>')
keymap.set('n', '<leader>u', ':Gitsigns reset_hunk<CR>')
keymap.set('n', '<leader>[', ':Gitsigns prev_hunk<CR>')
keymap.set('n', '<leader>]', ':Gitsigns next_hunk<CR>')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command =
  "nnoremap <buffer> <C-A-n> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i"
})
