require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {interval = 1000, follow_files = true},
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
  },
  current_line_blame_formatter = "--- <author>, <author_time:%Y-%m-%d> | <summary>",
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})
    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})
    -- Actions
    map('n', '<leader>gs', gs.stage_hunk, {desc = "Stage hunk"})
    map('n', '<leader>gr', gs.reset_hunk, {desc = "Reset hunk"})
    map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, {desc = "Stage selected"})
    map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, {desc = "Reset selected"})
    map('n', '<leader>gS', gs.stage_buffer, {desc = "Stage file"})
    map('n', '<leader>gp', gs.preview_hunk, {desc = "reset file"})
    map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "toggle line blame"})
    map('n', '<leader>gd', gs.diffthis, {desc = "Diff this file"})
    map('n', '<leader>td', gs.toggle_deleted, {desc = "toggle viewing of deleted lines"})
    map('n', '<leader>tl', gs.toggle_linehl, {desc = "toggle line change highlights"})
  end
}
