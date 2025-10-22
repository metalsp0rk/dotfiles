return {
	{
		"mfussenegger/nvim-dap",
		lazy = false, -- Ensure immediate loading
		config = function()
			local dap = require("dap")
			dap.adapters.gdb = {
				type = "executable",
				command = "arm-none-eabi-gdb",
				args = { "-i", "dap" },
			}
			dap.configurations.c = {
				{
					name = "Pico W Attach",
					type = "gdb",
					request = "attach",
					program = vim.fn.getcwd() .. "/build/" .. "fc-firmware.elf",
					cwd = vim.fn.getcwd(),
					sourcemaps = {
						{ vim.fn.getcwd(), vim.fn.getcwd() },
					},
					setupCommands = {
						{ text = "target remote localhost:3333" },
						{ text = "directory " .. vim.fn.getcwd() },
						{ text = "break main" },
						{ text = "continue" },
					},
				},
				{
					name = "Pico W Debug",
					type = "gdb",
					request = "launch",
					program = function()
						local root = vim.fn.getcwd()
						local elf_path = root .. "/build/" .. "fc-firmware.elf"
						-- Verify path exists
						if vim.fn.filereadable(elf_path) == 1 then
							return elf_path
						else
							error("ELF file not found: " .. elf_path)
						end
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
					sourceMaps = {
						{ "/home/spork/code/fan-controller-firmware/", vim.fn.getcwd() },
					},
					setupCommands = {
						{ text = "target remote localhost:3333" },
						{ text = "monitor reset init" },
						{ text = "sleep 100" },
						{ text = "load" },
						{ text = "sleep 100" },
						{ text = "monitor reset init" },
						{
							text = "directory " .. vim.fn.getcwd(),
						},
						{ text = "break main" },
					},
				},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{ "nvim-telescope/telescope-dap.nvim", lazy = false },
}
