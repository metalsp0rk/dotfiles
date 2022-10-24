local actions = require("diffview.actions")
local luamap = vim.keymap.set

require("diffview").setup({
  diff_binaries = false,
  enhanced_diff_hl = false,
  git_cmd = {"git"},
  use_icons = true,
})

-- luamap("n", "<leader>gd")
