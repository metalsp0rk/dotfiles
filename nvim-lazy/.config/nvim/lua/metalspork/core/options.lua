local set = vim.opt
local api = vim.api
--4 spaces with tab
set.tabstop = 2                                         --number of spaces that a <Tab> in the file counts for
set.shiftwidth = 2                                      --this determines indent guide and formating (invalid [--python--])
set.expandtab = true
set.clipboard = "unnamedplus"                           --copy to system clipboard

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5

vim.opt.updatetime = 50

set.splitright = true
set.splitbelow = true

--Relative line numbers and line numbers
set.number = true
set.relativenumber = true

vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.g.did_load_filetypes = 1
