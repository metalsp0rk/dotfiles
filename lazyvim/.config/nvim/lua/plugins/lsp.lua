return {
	"neovim/nvim-lspconfig",
	opts = function() end,
	keys = {
		{ "<C-Y>", desc = "LSP Completion", mode = { "i" } },
		{ "<CR>", false },
	},
}
