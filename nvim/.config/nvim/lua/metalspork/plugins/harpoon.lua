return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon" },
      mark_branch = false,
    })
    local map = vim.keymap.set
    map("n", "<leader>sa", function() require("harpoon.mark").add_file() end, {desc="Harpoon add"})
    map("n", "<leader>se", function() require("harpoon.ui").toggle_quick_menu() end, {desc="Harpoon quick menu"})
    map("n", "<leader>su", function() require("harpoon.cmd-ui").toggle_quick_menu() end, {desc="Harpoon command menu"})

    map("n", "<leader>sd", function() require("harpoon.term").gotoTerminal(1); end, {desc="Harpoon terminal 1"})
    map("n", "<leader>sf", function() require("harpoon.term").gotoTerminal(2); end, {desc="Harpoon terminal 2"})
    -- Terraform commands:
    -- map("n", "<leader>stip", function() require("harpoon.term").sendCommand(1, "cd " .. vim.fn.expand('%:p:h') .. " && terraform init && terraform plan -out=.terraform.tfstate\n"); end, {})
    -- map("n", "<leader>sta", function() require("harpoon.term").sendCommand(1, "cd " .. vim.fn.expand('%:p:h') .. " && terraform apply .terraform.tfstate\n"); end, {})
    -- map("n", "<leader>stp", function() require("harpoon.term").sendCommand(1, "cd " .. vim.fn.expand('%:p:h') .. " && terraform init && terraform plan -out=.terraform.tfstate\n"); end, {})

    map("n", "<leader>sh", function() require("harpoon.ui").nav_file(1); end, {desc="Harpoon file 1"})
    map("n", "<leader>sj", function() require("harpoon.ui").nav_file(2); end, {desc="Harpoon file 2"})
    map("n", "<leader>sk", function() require("harpoon.ui").nav_file(3); end, {desc="Harpoon file 3"})
    map("n", "<leader>sl", function() require("harpoon.ui").nav_file(4); end, {desc="Harpoon file 4"})

    map("n", "<leader>sH", function() require("harpoon.ui").nav_file(5); end, {desc="Harpoon file 5"})
    map("n", "<leader>sJ", function() require("harpoon.ui").nav_file(6); end, {desc="Harpoon file 6"})
    map("n", "<leader>sK", function() require("harpoon.ui").nav_file(7); end, {desc="Harpoon file 7"})
    map("n", "<leader>sL", function() require("harpoon.ui").nav_file(8); end, {desc="Harpoon file 8"})
  end
}
