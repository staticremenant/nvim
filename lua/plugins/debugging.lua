return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    event = "BufRead",
    config = function()
      require("dapui").setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks",      size = 0.25 },
              { id = "watches",     size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              -- "console",
            },
            size = 10,
            position = "bottom",
          },
        },
      })
      local dap, dapui = require('dap'), require('dapui')
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
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    event = "BufRead",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dap-go").setup()

      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<Leader>dc", dap.continue, {})

      vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
      vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
      vim.keymap.set("n", "<Leader>dsO", dap.step_out, {})
      vim.keymap.set("n", "<Leader>dq", dap.terminate, {})

      vim.keymap.set("n", "<Leader>du", dapui.toggle, {})

      vim.api.nvim_set_hl(0, 'DapBreakpointColor', { fg = '#7FC7FF' })
      vim.api.nvim_set_hl(0, 'DapStoppedColor', { fg = '#DCD0FF' })
      vim.api.nvim_set_hl(0, 'DapBreakpointRejectedColor', { fg = '#FFE5B4' })

      vim.fn.sign_define('DapBreakpoint', {
        text = '',
        texthl = 'DapBreakpointColor',
        linehl = '',
        numhl = 'DapBreakpointColor',
      })
      vim.fn.sign_define('DapStopped', {
        text = '󰈈',
        texthl = 'DapStoppedColor',
        linehl = '',
        numhl = 'DapStoppedColor',
      })
      vim.fn.sign_define('DapBreakpointRejected', {
        text = '',
        texthl = 'DapBreakpointColor',
        linehl = '',
        numhl = 'DapBreakpointColor',
      })
      -- NEED FIX maybe
      -- vim.fn.sign_define('DapBreakpointRejected', {
      --   text = '󱂼',
      --   texthl = 'DapBreakpointRejectedColor',
      --   linehl = '',
      --   numhl = 'DapBreakpointRejectedColor',
      -- })
      require('nvim-dap-virtual-text').setup()
    end,
  },
}
