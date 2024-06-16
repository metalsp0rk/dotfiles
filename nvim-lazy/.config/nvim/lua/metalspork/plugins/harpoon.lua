return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("harpoon").setup({
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon" },
      mark_branch = false,
    })
  end,
  keys = {
    {"<leader>sa", function() require('harpoon.mark').add_file() end, desc = "Harpoon add", mode = {"n"}},
    {"<leader>se", function() require('harpoon.ui').toggle_quick_menu() end, desc = "Harpoon quick menu", mode = {"n"}},
    {"<leader>sh", function() require('harpoon.ui').nav_file(1) end, desc = "Harpoon file 1", mode = {"n"}},
    {"<leader>sj", function() require('harpoon.ui').nav_file(2) end, desc = "Harpoon file 2", mode = {"n"}},
    {"<leader>sk", function() require('harpoon.ui').nav_file(3) end, desc = "Harpoon file 3", mode = {"n"}},
    {"<leader>sl", function() require('harpoon.ui').nav_file(4) end, desc = "Harpoon file 4", mode = {"n"}},
  }
}
