function _G.searchNearestQuote(level)
    local line, column = unpack(vim.api.nvim_win_get_cursor(0))
    -- vim.api.nvim_buf_get_text(0,line, column, )
    local currentLine  = string.sub(vim.api.nvim_get_current_line(), column + 1)
    local quotes       = { "'", '"', "`" }
    local closestQuote = { "", 500 }
    for k, v in pairs(quotes) do
        local i, j = string.find(currentLine, v)
        if i ~= nil and i < closestQuote[2] then
            closestQuote = { v, i }
        end
        -- print(closestQuote[1], closestQuote[2])
    end
    if closestQuote[1] ~= "" then
        local keysToExecute = vim.api.nvim_replace_termcodes("v" .. level .. closestQuote[1], true, false, true)
        vim.api.nvim_feedkeys(keysToExecute, "", false)
    end
end

-- Visualise nearest quote text object
vim.api.nvim_set_keymap("x", "aq", ":lua searchNearestQuote('a')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "iq", ":lua searchNearestQuote('i')<CR>", { noremap = true, silent = true })
