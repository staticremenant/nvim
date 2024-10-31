return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()
    require("dap-go").setup()

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

    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})

    vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
    vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
    vim.keymap.set("n", "<Leader>dsO", dap.step_out, {})
    vim.keymap.set("n", "<Leader>dq", dap.terminate, {})

    vim.keymap.set("n", "<Leader>du", dapui.toggle, {})
  end,
}
