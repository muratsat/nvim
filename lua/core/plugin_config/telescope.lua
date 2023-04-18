require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".pyc"}
  }
}

require('telescope').load_extension "file_browser"

local builtin = require('telescope.builtin')

local keymap = vim.keymap

-- See `:help telescope.builtin`
keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })

keymap.set('n', '<C-p>', builtin.find_files, { desc = '[S]earch [F]iles' })
keymap.set('n', '<leader>pf', builtin.git_files, { desc = 'Search git files' })
keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', { desc = 'Open file browser' })

-- search in current file
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find()
end, { desc = '[/] Fuzzily search in current buffer' })
