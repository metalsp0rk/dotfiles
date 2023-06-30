local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>mt', '<cmd>GenTocGFM<cr>', {silent=true, noremap = true})
