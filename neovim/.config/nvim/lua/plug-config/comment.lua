
local keymap = vim.api.nvim_set_keymap
local expr_opts = { noremap = true, silent = true, expr = true }
local opts = { noremap = true, silent = true }

require('nvim_comment').setup({
  marker_padding = true,
  comment_empty = false,
  comment_empty_trim_whitespace = false,
  create_mappings = true,
  line_mapping = "gcc",
  operator_mapping = "gc",
  comment_chunk_text = "ic",
  hook = function()
    if vim.api.nvim_buf_get_option(0, "filetype") == "hcl" then
      print("hcl pound")
      vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    end
    if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
      require("ts_context_commentstring.internal").update_commentstring()
    end
  end
})
