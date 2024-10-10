local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leaderdgt>"] = {
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

M.go = {
  n = {
    ["<leader>gf"] = {
      function()
        require('go.format').goimport()
      end,
      desc = "Go Format (goimports)"
    },
  },
}

M.goto_preview = {
  n = {
    ["gtd"] = {
      function()
        require('goto-preview').goto_preview_definition()
      end,
      desc = "Go To Definition"
    },
    ["gti"] = {
      function()
        require('goto-preview').goto_preview_implementation()
      end,
      desc = "Go To Implementation"
    },
    ["gtr"] = {
      function()
        require('goto-preview').goto_preview_references()
      end,
      desc = "Go To References"
    },
    ["gtq"] = {
      function()
        require('goto-preview').close_all_win()
      end,
      desc = "Close All Preview Windows"
    },
  },
}

M.nvterm = {
  plugin = true,
  n = {
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal terminal"
    },
  }
}

M.telescope = {
  n = {
    ["<leader>Tgs"] = {
      function()
        require('telescope.builtin').git_status()
      end,
      desc = "Telescope Git Status"
    },
  },
}

return M
