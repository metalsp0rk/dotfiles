-- local keymap = vim.api.nvim_set_keymap
local luamap = vim.keymap.set

require("harpoon").setup({
  save_on_toggle = false,
  save_on_change = true,
  enter_on_sendcmd = false,
  tmux_autoclose_windows = false,
  excluded_filetypes = { "harpoon" },
  mark_branch = false,
  projects = {
    ["$HOME/code/tf-solution-*"] = {
      term = { cmds = {
          "terraform init",
          "terraform plan --out=.terraform.tfstate",
          "terraform apply .terraform.tfstate",
          "terraform init && terraform plan --out=.terraform.tfstate",
        }
      }
    }
  }
})

luamap("n", "<leader>a", function() require("harpoon.mark").add_file() end, {})
luamap("n", "<leader>e", function() require("harpoon.ui").toggle_quick_menu() end, {})
luamap("n", "<leader>u", function() require("harpoon.cmd-ui").toggle_quick_menu() end, {})

luamap("n", "∂", function() require("harpoon.tmux").gotoTerminal(1); end, {})
luamap("n", "ƒ", function() require("harpoon.tmux").gotoTerminal(2); end, {})

luamap("n", "˙", function() require("harpoon.ui").nav_file(1); end, {})
luamap("n", "∆", function() require("harpoon.ui").nav_file(2); end, {})
luamap("n", "˚", function() require("harpoon.ui").nav_file(3); end, {})
luamap("n", "¬", function() require("harpoon.ui").nav_file(4); end, {})

luamap("n", "Ó", function() require("harpoon.ui").nav_file(5); end, {})
luamap("n", "Ô", function() require("harpoon.ui").nav_file(6); end, {})
luamap("n", "", function() require("harpoon.ui").nav_file(7); end, {})
luamap("n", "Ò", function() require("harpoon.ui").nav_file(8); end, {})

