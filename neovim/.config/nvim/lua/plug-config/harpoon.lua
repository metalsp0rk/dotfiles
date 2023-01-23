
local nnoremap = require("keymap").nnoremap
-- local keymap = vim.api.nvim_set_keymap
-- local luamap = vim.keymap.set

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

nnoremap("<leader>a", function() require("harpoon.mark").add_file() end)
nnoremap("´", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<leader>u", function() require("harpoon.cmd-ui").toggle_quick_menu() end)

nnoremap("∂", function() require("harpoon.tmux").gotoTerminal(1); end)
nnoremap("ƒ", function() require("harpoon.tmux").gotoTerminal(2); end)

nnoremap("˙", function() require("harpoon.ui").nav_file(1); end)
nnoremap("∆", function() require("harpoon.ui").nav_file(2); end)
nnoremap("˚", function() require("harpoon.ui").nav_file(3); end)
nnoremap("¬", function() require("harpoon.ui").nav_file(4); end)

nnoremap("Ó", function() require("harpoon.ui").nav_file(5); end)
nnoremap("Ô", function() require("harpoon.ui").nav_file(6); end)
nnoremap("", function() require("harpoon.ui").nav_file(7); end)
nnoremap("Ò", function() require("harpoon.ui").nav_file(8); end)

