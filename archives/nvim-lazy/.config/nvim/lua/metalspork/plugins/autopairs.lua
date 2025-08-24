return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require('nvim-autopairs').setup({
      enable_check_bracket_line = true,
      check_ts = true,
    })
  end,
}
