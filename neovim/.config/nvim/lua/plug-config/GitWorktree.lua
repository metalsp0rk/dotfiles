local Worktree = require("git-worktree")
local Job = require("plenary.job")
Worktree.on_tree_change(function(op,path,upsream)
    if op == "create" then
      Job:new({
        "git", "submodule", "update", "--recursive"
      })
    end
end)
