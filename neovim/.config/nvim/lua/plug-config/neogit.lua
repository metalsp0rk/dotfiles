local luamap = vim.keymap.set
local neogit = require('neogit')

neogit.setup {}

luamap("n", "<leader>gs", function() neogit.open({ }) end)
luamap("n", "<leader>gu", "<cmd>!git fetch --all<CR>")
luamap("n", "<leader>gP", "<cmd>!git pull --rebase<CR>")
luamap("n", "<leader>gcc", function() neogit.open({ "commit" }) end)
luamap("n", "<leader>gpu", "<cmd>!git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>")
luamap("n", "<leader>gpp", "<cmd>!git push<CR>")
luamap("n", "<leader>grm", "<cmd>!git rebase master<CR>")


-------------------------
--

-- keymap("n", "<leader>gv", ":Gvdiffsplit<CR>", opts)
-- -- " git checkout --filename at buffer level (use undo to revert checkout)
-- keymap("n", "<leader>gc", ":Gread<CR>", opts)
-- -- "Git add --filename
-- keymap("n", "<leader>ga", ":Gwrite<CR>", opts)
-- keymap("n", "<leader>gd", ":G diff<CR>", opts)
-- keymap("n", "<leader>gds", ":G diff --staged<CR>", opts)

-- keymap("n", "<leader>gcl", ":Gclog<cr>", opts)
-- keymap("n", "<leader>gs", ":0G<cr>", opts)
