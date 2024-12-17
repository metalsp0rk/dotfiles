return {
	"neovim/nvim-lspconfig",
	opts = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "<CR>", false }
		keys[#keys + 1] = {
			"<C-Y>",
			function()
				vim.lsp.buf.completion()
			end,
		}
	end,
}
