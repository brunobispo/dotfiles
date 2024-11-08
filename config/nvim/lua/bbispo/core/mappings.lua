vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- -- Edit vimrc
-- vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', { noremap = true })
--
-- -- NERDTree
-- vim.api.nvim_set_keymap('n', '<leader>\\', ':NERDTreeToggle<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>\\|', ':NERDTreeFind<cr>', { noremap = true })
--
-- -- Coc
-- vim.api.nvim_set_keymap('n', '<leader>ff', ':call CocActionAsync("format")<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>fp', ':call CocAction("runCommand", "prettier.formatFile")<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>fj', ':!python -m json.tool<cr>', { noremap = true })
vim.keymap.set('n', '<leader>cp', ':let @+ = expand("%")<cr>', { noremap = true })
--
-- -- FZF
-- vim.api.nvim_set_keymap('n', '<leader>p', ':Files<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>P', ':History<cr>', { noremap = true })
--
-- -- Insert mode mappings
vim.keymap.set('i', 'jk', '<esc>', { noremap = true })
vim.keymap.set('i', '<esc>', '<nop>', { noremap = true })
-- vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<esc>', '<nop>', { noremap = true })
--
-- -- Prevent jump when searching
-- vim.api.nvim_set_keymap('n', '*', '*``', { noremap = true })
