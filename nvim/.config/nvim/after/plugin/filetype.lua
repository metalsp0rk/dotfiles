require("filetype").setup({
  overrides = {
    -- complex = {
    --   [".*/templates/.*\\.yaml"] = "helm",
    -- }
    function_extensions = {
      ["yaml"] = function()
        local check = vim.fs.find("Chart.yaml", { path = vim.fn.expand("%:p:h"), upward = true })
        if not vim.tbl_isempty(check) then
          vim.bo.filetype = "helm"
          return "helm"
        else
          vim.bo.filetype = "yaml"
          return "yaml"
        end
      end
    }
  }
})
