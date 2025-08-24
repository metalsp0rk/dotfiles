return {
  "folke/trouble.nvim",
  name = "trouble",
  opts = {},
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc="Trouble: Diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc="Trouble: Buffer Diagnostics" },
    { "<leader>cs", "<cmd>Trouble diagnostics toggle focus=false<CR>", desc="Trouble: Symbols" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle <CR>", desc="Trouble: QuickFix List" },
    { "<leader>xL", "<cmd>Trouble loclist toggle <CR>", desc="Trouble: Location List" },
  }
}
