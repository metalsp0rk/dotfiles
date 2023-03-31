local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap

-- inoremap("<C-Space>", function () require("copilot").trigger_suggestion() end, {silent = true})

-- inoremap("<C-CR>", function() require("copilot").open() end, {silent = true})
--
vim.g.copilot_filetypes = { xml = false, markdown = false}

nnoremap("<C-Space>", ":Copilot panel<CR>", {silent = true})

-- inoremap("<leader>]", "copilot#next_suggestion()<CR>", {silent = true})
-- inoremap("<leader>[", "copilot#previous_suggestion()<CR>", {silent = true})
-- nnoremap("<leader>]", "copilot#next_suggestion()<CR>", {silent = true})
-- nnoremap("<leader>[", "copilot#previous_suggestion()<CR>", {silent = true})
