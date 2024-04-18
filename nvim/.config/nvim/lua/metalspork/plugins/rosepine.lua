return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000, -- default prio: 50
  config = function()
    vim.cmd('colorscheme rose-pine')
  end
}
