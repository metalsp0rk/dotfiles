return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPre",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    "folke/neodev.nvim"
  },
  config = function()
    require('nvim-treesitter.configs').setup (
    {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "yaml",
        "sql",
        "go",
        "terraform",
        "hcl",
        "bash",
        "nix",
        "json",
        "markdown",
        "vue",
        "helm",
        "javascript",
        "typescript",
      },
      -- ignore_install = { "javascript" },
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
      }
    })
  end
}
