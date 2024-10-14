return {
  event = "VeryLazy",
  "folke/noice.nvim",
  name = "noice",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    popupmenu = {
      enabled = true,
    },
    messages = {
      enabled = false
    },
    notify = {
      enabled = false
    },

  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify"
  }
}
