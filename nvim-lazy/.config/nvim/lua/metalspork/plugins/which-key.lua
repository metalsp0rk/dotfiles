return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  opts = {
    plugins = {
      registers = false
    },
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    window = {
      border = "none",
      margin = { 0, 0, 0, 0},
      padding  = { 1, 1, 1, 1},
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = false,
    show_help = true,
    show_keys = true,
    triggers = "auto",
  }
}
