return {
  'nvimdev/lspsaga.nvim',
  dependencies = { 'nvim-lspconfig' },
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = ''
      }
    })
    vim.keymap.set('n', '<leader>ac', ':Lspsaga code_action<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>rn', ':Lspsaga rename<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>ol', ':Lspsaga outline<cr>', { noremap = true })
    vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<cr>', { noremap = true })
    vim.keymap.set('n', '[g', ':Lspsaga diagnostic_jump_prev<cr>', { noremap = true })
    vim.keymap.set('n', ']g', ':Lspsaga diagnostic_jump_next<cr>', { noremap = true })
  end,
}
