vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- copy current path to clipboard
vim.keymap.set("n", "<leader>cp", ':let @+ = expand("%")<cr>', { noremap = true })

-- remap escape to jk
vim.keymap.set("i", "jk", "<esc>", { noremap = true })
vim.keymap.set("i", "<esc>", "<nop>", { noremap = true })

-- clean search highlights
vim.keymap.set("n", "<leader>/", ":nohlsearch<cr>", { noremap = true })
