local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- fugitive rebase shortcuts
keymap("n", "I", "0cepick<esc>", opts)
keymap("n", "R", "0cereword<esc>", opts)
keymap("n", "E", "0ceedit<esc>", opts)
keymap("n", "S", "0cesquash<esc>", opts)
keymap("n", "F", "0cefixup<esc>", opts)
keymap("n", "A", "0ceexec<esc>", opts)
keymap("n", "D", "0cedrop<esc>", opts)


keymap("n", "<leader>gbf", ":g/fixup/normal 0cefixup<esc>", opts)
keymap("n", "<leader>gbs", ":g/squash/normal 0cesquash<esc>", opts)

