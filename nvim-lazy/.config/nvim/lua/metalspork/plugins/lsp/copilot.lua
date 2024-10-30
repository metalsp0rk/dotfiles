local prompts = {
  -- Code related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  FixError = "Please explain the error in the following text and provide a solution.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  -- Text related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}
return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
              accept = "<C-s>",
            }
          },
          panel = {
            enabled = true
          }
        })
      end
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
      dependencies = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope.nvim"},
        {
          "folke/which-key.nvim",
          optional = true,
          opts = {
            spec = {
              { "<leader>a", group = "ai" },
              { "gm", group = "+Copilot chat" },
              { "gmh", desc = "Show help" },
              { "gmd", desc = "Show diff" },
              { "gmp", desc = "Show system prompt" },
              { "gms", desc = "Show selection" },
              { "gmy", desc = "Yank diff" },
            }
          }
        }
      },
      build = "make tiktoken",
      opts = {
        debug = false,
        question_header = "## User",
        answer_header = "## Copilot",
        error_header = "## Error",
        prompts = prompts,
        auto_follow_cursor = false,
        show_help = true,
        mappings = {
          complete = {
            detail = "Use @<Tab> or /<tab> for options.",
            insert = "<Tab>",
          },
          close = {
            normal = "q",
            insert = "<C-c>",
          },
          reset = {
            normal = "<C-x>",
            insert = "<C-x>",
          },
          submit_prompt = {
            normal = "<CR>",
            insert = "<C-s>",
          },
          accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
          },
          yank_diff = {
            normal = "gmy",
          },
          show_diff = {
            normal = "gmd",
          },
          show_system_prompt = {
            normal = "gmp",
          },
          show_user_selection = {
            normal = "gms",
          },
          show_help = {
            normal = "gmh",
          },
        },
      },
      config = function(_,opts)
        local chat = require("CopilotChat")
        local select = require("CopilotChat.select")

        opts.selection = select.unnamed

        opts.prompts.Commit = {
          prompt = "Write commit message for the change with commitizen convention",
          selection = select.gitdiff,
        }
        opts.prompts.CommitStaged = {
          prompt = "Write commit message for the change with commitizen convention",
          selection = function(source)
            return select.gitdiff(source, true)
          end,
        }

        chat.setup(opts)
        require("CopilotChat.integrations.cmp").setup()

        vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
          chat.ask(args.args, {selection = select.visual})
        end, { nargs = "*", range = true})
      end,
    }
  },
  keys = {
    { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
    { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
    { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
    {mode = "n", '<leader>ts', function() require('copilot.suggestion').toggle_auto_trigger() end, desc="Toggle Copilot"},
    {mode = "n", '<leader>ai', function() require('CopilotChat').toggle() end, desc="Toggle Copilot Chat"},
    {mode = "i", "<C-]>", function() require('copilot.suggestion').next() end, desc="Copilot Next Suggestion"},
    {mode = "i", "<C-s>", function() require('copilot.suggestion').accept() end, desc="Copilot accept"},
    { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
    -- Fix the issue with diagnostic
    { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
    -- Clear buffer and chat history
    { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
    -- Toggle Copilot Chat Vsplit
    { "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
    -- Copilot Chat Models
    { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
  },
}
