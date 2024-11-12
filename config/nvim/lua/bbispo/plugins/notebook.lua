return {
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup({
        style = "markdown",
        output_extension = "md",
        force_ft = "markdown",
      })
    end
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "quarto", "markdown" },
    config = function()
      local quarto = require("quarto")
      quarto.setup({
        lspFeatures = {
          -- NOTE: put whatever languages you want here:
          languages = { "r", "python", "rust" },
          chunks = "all",
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        -- keymap = {
        --   -- NOTE: setup your own keymaps:
        --   hover = "H",
        --   definition = "gd",
        --   rename = "<leader>rn",
        --   references = "gr",
        --   format = "<leader>gf",
        -- },
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      })
    end
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    config = function()
      -- I find auto open annoying, keep in mind setting this option will require setting
      -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
      vim.g.molten_auto_open_output = false

      -- this guide will be using image.nvim
      -- Don't forget to setup and install the plugin if you want to view image outputs
      vim.g.molten_image_provider = "image.nvim"

      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true

      -- this is an example, not a default. Please see the readme for more configuration options
      -- vim.g.molten_output_win_max_height = 12

      -- use the python from your conda environment
      -- vim.g.python3_host_prog = vim.fn.expand("~/miniconda3/bin/python3")

      vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
      vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>",
        { desc = "open output window", silent = true })
      vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
      vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
        { desc = "execute visual selection", silent = true })
      vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
      vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

      -- if you work with html outputs:
      vim.keymap.set("n", "<leader>mx", ":MoltenOpenInBrowser<CR>",
        { desc = "open output in browser", silent = true })

      local runner = require("quarto.runner")
      vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
      vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
      vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
      vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
      vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
      vim.keymap.set("n", "<leader>RA", function()
        runner.run_all(true)
      end, { desc = "run all cells of all languages", silent = true })
    end,
  }
}
