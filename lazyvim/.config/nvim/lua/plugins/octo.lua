return {
	{
		lazy = false,
		cmd = "Octo",
		"pwntester/octo.nvim",
		depends = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			default_merge_method = "rebase",
			use_emojis = true,
			suppress_missing_scope = {
				projects_v2 = true,
			},
			users = "assignable",
		},
		keys = {
			{ "<leader>po", "<cmd>Octo pr<CR>", desc = "Open PR for current branch" },
			{ "<leader>pl", "<cmd>Octo pr list<CR>", desc = "List PRs for this repo" },
			{ "<leader>pc", "<cmd>Octo pr checks<CR>", desc = "Show PR checks" },
			{ "<leader>pC", "<cmd>Octo pr commits<CR>", desc = "Show PR commits" },
		},
	},
}
