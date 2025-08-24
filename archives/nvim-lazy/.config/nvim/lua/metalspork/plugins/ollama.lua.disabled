return {
  "nomnivore/ollama.nvim",
  name = "ollama",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    model = "codestral",
    url = "http://127.0.0.1:11434",
    prompts = {
      Sample_Prompt = {
        prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
        input_label = "> ",
        model = "codestral",
        action = "display",
      }
    }
  },
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  keys = {
    {"<leader>og", function() require('ollama').prompt("Generate_Code") end, desc = "Ollama gen code", mode = {"n", "v"}},
    {"<leader>oo", function() require('ollama').prompt() end, desc = "Ollama prompt", mode = {"n", "v"}},
    {"<leader>oo", function() require('ollama').prompt() end, desc = "Ollama prompt", mode = {"n", "v"}},
  }
}

