return {
  "mbbill/undotree",
  event = "BufReadPre",
  config = function()
    local m = vim.keymap
    m.set("n", "<leader>tu", "<CMD>UndotreeToggle<CR>", { desc="Toggle Undo Tree", silent = true })
  end
}
