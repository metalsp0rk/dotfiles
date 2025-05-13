local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>bw", ":w<CR>", { noremap = true, silent = true, desc = "Save buffer" })
vim.keymap.set("n", "<leader>te", ":LazyExtras<CR>", { noremap = true, silent = true, desc = "Toggle Lazy Extras" })
vim.keymap.set("n", "<leader>tl", ":Lazy<CR>", { noremap = true, silent = true, desc = "Toggle Lazy" })

--- inline regex
vim.keymap.set("n", "S", ":%s//g<Left><Left>", { noremap = true })
vim.keymap.set("v", "<C-s>", ":s//g<Left><Left>", { noremap = true })

--- Quick Splits
vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>", { noremap = true, silent = true })

--- Centralize scrolling

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
