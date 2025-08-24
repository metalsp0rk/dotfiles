
vim.g.copilot_filetypes = { xml = false, markdown = false}

vim.keymap.set("n", "<C-c>", ":Copilot panel<CR>", {desc="Open Copilot panel", silent = true})

