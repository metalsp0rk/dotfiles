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
  end,
  keys = {
    { mode = {'n'}, "<leader>pf", function() require('telescope.builtin').find_files() end, desc = "Telescope: Project Files"},
    { mode = {'n'}, "<leader>pc", function() require('telescope.builtin').colorscheme() end, desc = "Telescope: Color Scheme"},
    { mode = {'n'}, "<leader>pd", function() require('telescope.builtin').diagnostics() end, desc = "Telescope: buffer diagnostics"},
    { mode = {'n'}, "<leader>gb", function() require('telescope.builtin').git_branches() end, desc = "Telescope: Git Branch"},
    { mode = {'n'}, "<C-p>", function() require('telescope.builtin').git_files() end, desc = "Telescope: Git Files"},
    { mode = {'n'}, "<C-o>", function() require('telescope.builtin').buffers() end, desc = "Telescope: Buffers"},
    { mode = {'n'}, "<leader>fe", "<CMD>Telescope glyph<CR>", desc = "Telescope: Emoji"},
    { mode = {'n'}, "ps", function() require('telescope.builtin').grep_string({search = vim.fn.input('Grep > ')}) end, desc = "Telescope: Grep"},
  }
}
