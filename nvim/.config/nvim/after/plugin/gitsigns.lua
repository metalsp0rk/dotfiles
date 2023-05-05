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
    map('n', '<leader>cs', gs.stage_hunk)
    map('n', '<leader>cr', gs.reset_hunk)
    map('v', '<leader>cs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
    map('v', '<leader>cr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
    map('n', '<leader>cS', gs.stage_buffer)
    map('n', '<leader>cu', gs.undo_stage_hunk)
    map('n', '<leader>cR', gs.reset_buffer)
    map('n', '<leader>cp', gs.preview_hunk)
    map('n', '<leader>cb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>cd', gs.diffthis)
    map('n', '<leader>cD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)
    map('n', '<leader>tl', gs.toggle_linehl)
  end
}
