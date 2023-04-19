vim.g.mapleader = " "
local keymap = vim.keymap

-- Better window movement
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Move selected line / block of text in visual mode
keymap.set("x", "K", ":move '<-2<CR>gv-gv")
keymap.set("x", "J", ":move '>+1<CR>gv-gv")

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move current line / block with Alt-j/k ala vscode.
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")


-- format on save 
keymap.set("n", "<C-f>", ":Prettier<CR>")
keymap.set("i", "<C-f>", ":Prettier<CR>")

keymap.set('n', '<C-s>', ":w<CR>")
keymap.set('i', '<C-s>', "<Esc>:w<CR>a")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- quick erase with ctrlackspace
keymap.set("i", "<C-H>", "<C-W>")

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
