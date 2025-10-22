return {
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("dap")

			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			-- Keybinds for dap-telescope
			map("n", "<leader>dc", "<cmd>Telescope dap configurations<CR>", opts)
			map("n", "<leader>dlb", "<cmd>Telescope dap list_breakpoints<CR>", opts)
			map("n", "<leader>dv", "<cmd>Telescope dap variables<CR>", opts)

			-- Standard dap keybinds
			map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
			map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
			map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
			map("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
		end,
	},
}
