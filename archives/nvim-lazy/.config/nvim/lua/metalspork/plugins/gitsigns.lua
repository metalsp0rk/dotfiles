return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
  opts = {
    current_line_blame = true,
    trouble = true,
    current_line_blame_formatter = "--- <author>, <author_time:%Y-%m-%d> | <summary>",
    signcolumn = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr = true})
      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})
      -- Actions
      map('n', '<leader>ga', gs.stage_hunk, {desc = "Stage hunk"})
      map('n', '<leader>gr', gs.reset_hunk, {desc = "Reset hunk"})
      map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, {desc = "Stage selected"})
      map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, {desc = "Reset selected"})
      map('n', '<leader>gA', gs.stage_buffer, {desc = "Stage file"})
      map('n', '<leader>gp', gs.preview_hunk, {desc = "reset file"})
      map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "toggle line blame"})
      map('n', '<leader>gD', gs.diffthis, {desc = "Diff this file"})
      map('n', '<leader>td', gs.toggle_deleted, {desc = "toggle viewing of deleted lines"})
      map('n', '<leader>th', gs.toggle_linehl, {desc = "toggle line change highlights"})
    end,
  }
}
