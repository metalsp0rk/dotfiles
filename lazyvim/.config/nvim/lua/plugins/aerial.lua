return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			show_guides = true,
		})
	end,
	keys = {
		{ mode = { "n" }, "{", "<CMD>AerialPrev<CR>", { noremap = true, silent = true }, desc = "Aerial: Previous" },
		{ mode = { "n" }, "}", "<CMD>AerialNext<CR>", { noremap = true, silent = true }, desc = "Aerial: Next" },
		{
			mode = { "n" },
			"<leader>to",
			"<CMD>AerialToggle<CR>",
			{ noremap = true, silent = true },
			desc = "Aerial: Toggle Sidebar",
		},
	},
}
