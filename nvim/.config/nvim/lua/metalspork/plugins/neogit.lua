return {
  "NeogitOrg/neogit",
  config = function()
    local neogit = require('neogit')
    neogit.setup {}
    local map = vim.keymap.set
    map("n", "<leader>gs", function()neogit.open({ }) end, {desc="Open neogit menu"})
    map("n", "<leader>gc", function()neogit.open({ "commit" }) end, {desc = "open Neogit commit menu"})
  end
}
