local keymap = vim.api.nvim_set_keymap
require'hop'.setup()

keymap("n", "s", "<cmd>HopChar1<CR>", {desc="Hop to character"})
keymap("v", "s", "<cmd>HopChar1<CR>", {desc="Hop to character"})
