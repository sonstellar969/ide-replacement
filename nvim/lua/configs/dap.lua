local M = {}

function M.setup()
  local dap = require "dap"
  local dapui = require "dapui"

  dapui.setup()
  require("mason-nvim-dap").setup {
    ensure_installed = { "codelldb" },
    automatic_installation = true,
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  }

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

  dap.configurations.cpp = {
    {
      name = "Launch C/C++ executable",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      runInTerminal = true,
    },
  }
  dap.configurations.c = dap.configurations.cpp

  local function start_debugging()
    dapui.open()
    dap.continue()
  end

  vim.keymap.set("n", "<F5>", start_debugging, { desc = "Debug: start/continue" })
  vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
  vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
end

return M
