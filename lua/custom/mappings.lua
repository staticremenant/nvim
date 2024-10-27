local M = {}

local function nvim_tree_toggle_with_delay()
  local api = require('nvim-tree.api')
  if api.tree.is_visible() then
    api.tree.close()
  else
    api.tree.open()
  end
end

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dss"] = {
      function()
        require('dapui').toggle()
        vim.defer_fn(function()
          nvim_tree_toggle_with_delay()
        end, 50)
      end,
      "Toggle debugging sidebar (dap-ui)"
    },
    ["<leader>dsd"] = {
      function()
        require('dap').continue()
      end,
      "Start/Continue debugging"
    },
    ["<leader>dso"] = {
      function()
        require('dap').step_over()
      end,
      "Step over"
    },
    ["<leader>dsi"] = {
      function()
        require('dap').step_into()
      end,
      "Step into"
    },
    ["<leader>dsO"] = {
      function()
        require('dap').step_out()
      end,
      "Step out"
    },
    ["<leader>dq"] = {
      function()
        local dap = require('dap')
        local api = require('nvim-tree.api')
        local dapui = require('dapui')

        if dap.session() then
          dap.terminate()
          dapui.close()
          vim.defer_fn(function()
            api.tree.open()
          end, 50)
        else
          dapui.close()
          vim.defer_fn(function()
            if not api.tree.is_visible() then
              api.tree.open()
            end
          end, 50)
        end
      end,
      "Terminate debugging"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

return M
