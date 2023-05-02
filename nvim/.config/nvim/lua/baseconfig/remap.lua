local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--- buffer management
vim.keymap.set("n", "<leader>l", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>h", ":bprev<CR>", opts)
vim.keymap.set("n", "<leader>q", ":quit<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>Q", ":qall<CR>", opts)
vim.keymap.set("n", "<leader>d", ":bdelete<CR>", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- window management
vim.keymap.set("n", "<leader>-", ":split<CR>", opts)
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>", opts)

-- easier window navigation
vim.keymap.set("n", "<C-h>", ":winc h<CR>", opts)
vim.keymap.set("n", "<C-j>", ":winc j<CR>", opts)
vim.keymap.set("n", "<C-k>", ":winc k<CR>", opts)
vim.keymap.set("n", "<C-l>", ":winc l<CR>", opts)

vim.keymap.set("i", "kk", "<esc>k", opts)
vim.keymap.set("i", "jj", "<esc>j", opts)


--- tab management

vim.keymap.set("n", "S", ":%s//g<Left><Left>", {noremap = true})

-- paste text on new line, if there is already linebreak do not insert a new one
vim.keymap.set("n", "<leader>p", [[match(getreg(), "\n$") == -1 ? "o<esc>p" : "p"]], expr_opts)
vim.keymap.set("n", "<leader>P", [[match(getreg(), "\n$") == -1 ? "O<esc>p" : "P"]], expr_opts)

vim.keymap.set("v", "p", [[mode() ==# "V" && match(getreg(), "\n$") == -1 ? "\"_dd<esc>O<esc>p" : "\"_dP"]], expr_opts)


-- move lines
vim.keymap.set("n", "<M-Up>", [[:<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``]], opts)
vim.keymap.set("n", "<M-Down>", [[:<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``]], opts)
vim.keymap.set("i", "<M-Up>", [[<C-O>m`<C-O>:move -2<CR><C-O>``]], opts)
vim.keymap.set("i", "<M-Down>", [[<C-O>m`<C-O>:move +1<CR><C-O>``]], opts)
vim.keymap.set("v", "<M-Up>", [[:<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv]], opts)
vim.keymap.set("v", "<M-Down>", [[:<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv]], opts)

-- indent and keep stay in visualMode
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- escape: also clears highlighting
vim.keymap.set("n", "<esc>", "<Cmd>noh<return><esc>", opts)

-- leader x will chmod +x the current file
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", opts)

-- Quick SO!
vim.keymap.set("n", "<leader>so", ":so ~/.config/nvim/init.lua<CR>", opts)
