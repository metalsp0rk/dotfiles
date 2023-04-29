
local neogit = require("neogit")
neogit.setup {}

vim.keymap.set("n", "<leader>gs", function()neogit.open({ }) end)
vim.keymap.set("n", "<leader>gc", function()neogit.open({ "commit" }) end)
