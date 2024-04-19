return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ghassan0/telescope-glyph.nvim"
  },
  config = function()
    local builtin = require('telescope.builtin')
    require('telescope').load_extension('glyph')
    local map = vim.keymap.set
    map('n', '<leader>pf', builtin.find_files, {desc = "Find files in project"})
    map('n', '<C-p>', builtin.git_files, {desc = "Find files in Git"})
    map('n', '<C-o>', builtin.buffers, {desc = "Find Buffers"})
    map('n', '<leader>fg', "<CMD>Telescope glyph<CR>", { desc = "Find Emoji"})
    map('n', '<leader>ps', function()
      builtin.grep_string({search = vim.fn.input('Grep > ')})
    end, {desc = "Project Search"})
  end
}
