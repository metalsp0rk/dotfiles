local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>tt', ':TableModeToggle<CR>', {noremap = true, silent = true})
keymap('v', '<leader>tt', ':TableModeToggle<CR>', {noremap = true, silent = true})

