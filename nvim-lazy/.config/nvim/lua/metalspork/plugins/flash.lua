return {
  "folke/flash.nvim",
  opts = {},
  name = "flash",
  keys = {
    { "s", mode = {"n", "x", "o"}, function() require("flash").jump() end, desc = "Flash"},
  }
}
