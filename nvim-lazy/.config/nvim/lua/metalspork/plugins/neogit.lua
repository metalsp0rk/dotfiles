return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
    "nvim-telescope/telescope.nvim"
  },
  version = "v0.0.1",
  config = true,
  keys = {
    {mode = "n", '<leader>gs', function() require('neogit').open({}) end, desc="Open Neogit"}
  }
}
