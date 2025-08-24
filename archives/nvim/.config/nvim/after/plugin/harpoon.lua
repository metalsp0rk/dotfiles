-- local keymap = vim.api.nvim_set_keymap
local luamap = vim.keymap.set

require("harpoon").setup({
  save_on_toggle = false,
  save_on_change = true,
  enter_on_sendcmd = false,
  tmux_autoclose_windows = false,
  excluded_filetypes = { "harpoon" },
  mark_branch = false,
})

luamap("n", "<leader>sa", function() require("harpoon.mark").add_file() end, {desc="Harpoon add"})
luamap("n", "<leader>se", function() require("harpoon.ui").toggle_quick_menu() end, {desc="Harpoon quick menu"})
luamap("n", "<leader>su", function() require("harpoon.cmd-ui").toggle_quick_menu() end, {desc="Harpoon command menu"})

luamap("n", "<leader>sd", function() require("harpoon.term").gotoTerminal(1); end, {desc="Harpoon terminal 1"})
luamap("n", "<leader>sf", function() require("harpoon.term").gotoTerminal(2); end, {desc="Harpoon terminal 2"})
-- Terraform commands:
-- luamap("n", "<leader>stip", function() require("harpoon.term").sendCommand(1, "cd " .. vim.fn.expand('%:p:h') .. " && terraform init && terraform plan -out=.terraform.tfstate\n"); end, {})
-- luamap("n", "<leader>sta", function() require("harpoon.term").sendCommand(1, "cd " .. vim.fn.expand('%:p:h') .. " && terraform apply .terraform.tfstate\n"); end, {})
-- luamap("n", "<leader>stp", function() require("harpoon.term").sendCommand(1, "cd " .. vim.fn.expand('%:p:h') .. " && terraform init && terraform plan -out=.terraform.tfstate\n"); end, {})

luamap("n", "<leader>sh", function() require("harpoon.ui").nav_file(1); end, {desc="Harpoon file 1"})
luamap("n", "<leader>sj", function() require("harpoon.ui").nav_file(2); end, {desc="Harpoon file 2"})
luamap("n", "<leader>sk", function() require("harpoon.ui").nav_file(3); end, {desc="Harpoon file 3"})
luamap("n", "<leader>sl", function() require("harpoon.ui").nav_file(4); end, {desc="Harpoon file 4"})

luamap("n", "<leader>sH", function() require("harpoon.ui").nav_file(5); end, {desc="Harpoon file 5"})
luamap("n", "<leader>sJ", function() require("harpoon.ui").nav_file(6); end, {desc="Harpoon file 6"})
luamap("n", "<leader>sK", function() require("harpoon.ui").nav_file(7); end, {desc="Harpoon file 7"})
luamap("n", "<leader>sL", function() require("harpoon.ui").nav_file(8); end, {desc="Harpoon file 8"})
