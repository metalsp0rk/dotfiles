return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
              accept = "<C-Return>",
            }
          },
          panel = {
            enabled = true
          }
        })
      end
    }
  },
  config = function() require("copilot_cmp").setup() end,
  keys = {
    {mode = "n", '<leader>tc', function() require('copilot.suggestion').toggle_auto_trigger() end, desc="Toggle Copilot"},
    {mode = "i", "<C-l>", function() require('copilot.suggestion').next() end, desc="Copilot Next Suggestion"},
    {mode = "i", "<C-h>", function() require('copilot.suggestion').dismiss() end, desc="Copilot dismiss"},
    {mode = "i", "<C-Return>", function() require('copilot.suggestion').accept() end, desc="Copilot accept"},
  }
}
