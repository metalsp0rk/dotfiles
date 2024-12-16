local set = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "

set.tabstop = 2 --number of spaces that a <Tab> in the file counts for
set.shiftwidth = 2 --this determines indent guide and formating (invalid [--python--])
set.showtabline = 2
set.expandtab = true
set.clipboard = "unnamedplus" --copy to system clipboard
set.smartindent = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.cursorline = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 5

set.updatetime = 50

set.splitright = true
set.splitbelow = true

set.signcolumn = "yes"
set.wrap = true

--Relative line numbers and line numbers
set.number = true
set.relativenumber = true

set.spelllang = "en_us"
set.spell = true

vim.o.timeoutlen = 0
vim.o.timeout = true
