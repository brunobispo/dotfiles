return {
  "catppuccin/nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        mocha = {
          base = "#121212",
          mantle = "#121212",
          -- crust = "#121212",
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
