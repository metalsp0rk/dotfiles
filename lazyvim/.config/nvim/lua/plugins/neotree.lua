return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree", remap = true },
		{ "<leader>E", false },
		{ "<leader>fE", false },
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_hidden = false,
			},
		},
	},
}
