return {
	"mfussenegger/nvim-dap-python",
	keys = {
		{ "<leader>dPt", "<cmd>lua require('dap-python').test_method()<cr>", desc = "Test Method" },
		{ "<leader>dPc", "<cmd>lua require('dap-python').test_class()<cr>", desc = "Test Class" },
	},
	config = function()
		require("dap-python").setup("uv")
	end,
}
