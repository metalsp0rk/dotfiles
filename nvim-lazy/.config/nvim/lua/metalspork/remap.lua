local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--- buffer management
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", ":qall<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>d", ":bp<bar>sp<bar>bn<bar>bd<CR>", { noremap = true, silent = true, desc = "Close Buffer" })
vim.keymap.set("n", "<leader>D", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

--- window management
vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>", { noremap = true, silent = true })

-- easier window navigation
vim.keymap.set("n", "<C-h>", ":winc h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":winc j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":winc k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":winc l<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "kk", "<esc>k", { noremap = true, silent = true })
vim.keymap.set("i", "jj", "<esc>j", { noremap = true, silent = true })

vim.keymap.set("t", "<C-\\>", "<C-\\><C-N>", { noremap = true, silent = true })


--- tab management

vim.keymap.set("n", "S", ":%s//g<Left><Left>", {noremap = true})
vim.keymap.set("v", "S", ":s//g<Left><Left>", {noremap = true})

-- paste text on new line, if there is already linebreak do not insert a new one
vim.keymap.set("n", "<leader>p", [[match(getreg(), "\n$") == -1 ? "o<esc>p" : "p"]], { noremap = true, silent = true, expr = true })
vim.keymap.set("n", "<leader>P", [[match(getreg(), "\n$") == -1 ? "O<esc>p" : "P"]], { noremap = true, silent = true, expr = true })

vim.keymap.set("v", "p", [[mode() ==# "V" && match(getreg(), "\n$") == -1 ? "\"_dd<esc>O<esc>p" : "\"_dP"]], { noremap = true, silent = true, expr = true })


-- move lines
vim.keymap.set("n", "<M-Up>", [[:<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``]], { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", [[:<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``]], { noremap = true, silent = true })
vim.keymap.set("i", "<M-Up>", [[<C-O>m`<C-O>:move -2<CR><C-O>``]], { noremap = true, silent = true })
vim.keymap.set("i", "<M-Down>", [[<C-O>m`<C-O>:move +1<CR><C-O>``]], { noremap = true, silent = true })
vim.keymap.set("v", "<M-Up>", [[:<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv]], { noremap = true, silent = true })
vim.keymap.set("v", "<M-Down>", [[:<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv]], { noremap = true, silent = true })

-- indent and keep stay in visualMode
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- escape: also clears highlighting
vim.keymap.set("n", "<esc>", "<Cmd>noh<return><esc>", { noremap = true, silent = true })

-- leader x will chmod +x the current file
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", { desc="Make file executable", noremap = true, silent = true })

-- Quick SO!
vim.keymap.set("n", "<leader>so", ":so ~/.config/nvim/init.lua<CR>", { desc="Reload configuration", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fd", ":filetype detect<CR>", { desc="Force re-dection of filetype", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fi", ":LspInfo<CR>", { desc="Get LSP Information", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", "<CMD>Lazy<CR>", { desc="Open Lazy Dialog", noremap = true, silent = true })
