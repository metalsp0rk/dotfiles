require('aerial').setup({
  default_direction = "left",
  nerd_font = true,
  show_guides = true,
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {noremap = true, silent = true})
  end
})

-- toggle | also disables fade plugin
vim.api.nvim_set_keymap( "n", "<leader>to", ":AerialToggle <CR>", {silent = true})
