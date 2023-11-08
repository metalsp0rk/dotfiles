
local neogit = require("neogit")
neogit.setup {}

vim.keymap.set("n", "<leader>gs", function()neogit.open({ }) end, {desc="Open neogit menu"})
vim.keymap.set("n", "<leader>gc", function()neogit.open({ "commit" }) end, {desc = "open Neogit commit menu"})
