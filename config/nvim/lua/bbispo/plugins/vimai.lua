return {
  "madox2/vim-ai",
  config = function()
    vim.g.vim_ai_chat = {
      options = {
        model = "gpt-4o",
      }
    }
  end,
}
