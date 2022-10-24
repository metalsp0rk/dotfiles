
local nnoremap = require("keymap").nnoremap
-- local keymap = vim.api.nvim_set_keymap
-- local luamap = vim.keymap.set

require("harpoon").setup({
  save_on_toggle = false,
  save_on_change = true,
  enter_on_sendcmd = false,
  tmux_autoclose_windows = false,
  excluded_filetypes = { "harpoon" },
  mark_branch = false,
})

nnoremap("<leader>a", function() require("harpoon.mark").add_file() end)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end)
nnoremap("<C-j>", function() require("harpoon.ui").nav_file(2) end)
nnoremap("<C-k>", function() require("harpoon.ui").nav_file(3) end)
nnoremap("<C-l>", function() require("harpoon.ui").nav_file(4) end)

