local nnoremap = require("keymap").nnoremap
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")


require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
})

require("telescope").load_extension("harpoon")
require("telescope").load_extension("git_worktree")

local M = {}
M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			map("n", "<c-c>", actions.git_create_branch)
			map("i", "<c-c>", actions.git_create_branch)
			return true
		end,
	})
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< DotFiles >",
		cwd = vim.env.DOTFILES,
		hidden = true,
    file_ignore_patterns = { ".git/.*" }
	})
end


nnoremap("<C-p>", ":Telescope")

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

nnoremap("<leader>vd", function()
    M.search_dotfiles()
end)

nnoremap("<leader>gc", function()
    M.git_branches()
end)

