return {
	"NeogitOrg/neogit",
	priority = 1,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
		"nvim-telescope/telescope.nvim",
	},
	config = true,
	keys = {
		{
			mode = "n",
			"<leader>gs",
			function()
				require("neogit").open({})
			end,
			desc = "Open Neogit",
			remap = true, -- You will obey me
		},
		{
			mode = "n",
			"<leader>tg",
			function()
				require("neogit").open({})
			end,
			desc = "Open Neogit",
			remap = true, -- You will obey me
		},
	},
}
