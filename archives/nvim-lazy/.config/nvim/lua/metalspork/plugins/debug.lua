return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require('dap')
    local dap_virtual_text = require('nvim-dap-virtual-text')
    local dapui = require('dapui')
    local function get_project_root()
      local current_dir = vim.loop.cwd()
      local git_repo = io.popen("git rev-parse --show-toplevel 2>/dev/null"):read("*line")
      if git_repo ~= nil then
        return git_repo
      else
        return current_dir
      end
    end

    dap_virtual_text.setup {
      enabled_commands = true,
      highlight_new_as_changed = true,
      highlight_changed_variables = true,
      show_stop_reason = true,
      only_first_definition = true,
    }
    dapui.setup()
    local map = vim.keymap.set
    -- {'n', '<leader>')

    ---- Adapters:
    dap.adapters.delve = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}'}
      }
    }


    ---- Configurations:

    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug Project",
        request = "launch",
        program = function()
          return get_project_root() .. "/main.go"
        end
      },
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
      },
      {
        type = "delve",
        name = "Debug Test Project",
        request = "launch",
        mode = "test",
        program = function()
          return get_project_root() .."/main_test.go"
        end
      },
      {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}"
      }
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      }
    }

    ----
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {

    {mode = 'n', '<leader>bt', function() require('dap').toggle_breakpoint() end, desc="Debugger: Toggle Breakpoint"},
    {mode = 'n', '<leader>bc', function() require('dap').continue() end, desc="Debugger: Continue"},
    {mode = 'n', '<leader>bo', function() require('dap').step_over() end, desc="Debugger: Step Over"},
    {mode = 'n', '<leader>bu', function() require('dap').step_out() end, desc="Debugger: Step Out"},
    {mode = 'n', '<leader>bi', function() require('dap').step_into() end, desc="Debugger: Step Into"},
    {mode = 'n', '<leader>bx', function() require('dap').terminate() end, desc="Debugger: Terminate"},
    {mode = 'n', '<leader>td', function() require('dapui').toggle() end, desc="Debugger: Toggle UI"},
    {mode = 'n', '<leader>bh', function() require('dapui').open({reset = true}) end, desc="Debugger: Reset UI"},
    {mode = 'n', '<leader>br', function() require('dap').repl.open() end, desc="Debugger: Open REPL"},
    {mode = 'n', '<leader>bv', function() require('nvim-dap-virtual-text').toggle() end, desc="Debugger: toggle virtual text"},
  }
}
