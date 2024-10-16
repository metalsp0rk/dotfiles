return {
  "huynle/ogpt.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  event = "VeryLazy",
  opts = {
    default_provider = "ollama",
    providers = {
      ollama = {
        api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
        api_key = os.getenv("ollama_API_KEY") or "",
        model = {
          name = "codestral:latest"
        }
      }
    }
  }
}
