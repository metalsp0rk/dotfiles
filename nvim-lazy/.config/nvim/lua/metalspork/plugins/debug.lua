return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
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
        name = "Debug",
        request = "launch",
        program = "${file}"
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
    {mode = 'n', '<leader>br', function() require('dap').repl.open() end, desc="Debugger: Open REPL"},
  }
}
