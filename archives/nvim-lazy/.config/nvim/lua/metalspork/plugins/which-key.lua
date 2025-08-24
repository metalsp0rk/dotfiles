return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      registers = false
    },
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    win = {
      padding  = {1, 1},
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    show_help = true,
    show_keys = true,
  }
}
