local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>mt', '<cmd>GenTocGFM<cr>', {desc = "Generate Github formatted TOC", silent=true, noremap = true})
