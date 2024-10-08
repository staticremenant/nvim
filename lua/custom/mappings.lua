local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
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
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
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

M.gitsigns = {
  plugin = true,
  n = {
    ["<leader>gd"] = {
      function()
        vim.g.previous_git_diff_buf = vim.api.nvim_get_current_buf()
        require('gitsigns').diffthis()
      end,
      "Show git diff"
    },
    ["<leader>gq"] = {
      function()
        local initial_buf = vim.g.previous_git_diff_buf
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local bufname = vim.api.nvim_buf_get_name(buf)
          local is_modified = vim.bo[buf].modified
          if buf ~= initial_buf and not bufname:match("NvimTree_") and not is_modified then
            vim.api.nvim_win_close(win, false)
          end
        end

        if vim.api.nvim_buf_is_valid(initial_buf) then
          vim.api.nvim_set_current_buf(initial_buf)
        end
      end,
      "Close git diff"
    },
  }
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

M.noice = {
  n = {
    ["<leader>Nh"] = {
      function()
        require("noice").cmd("history")
      end,
      desc = "Show Noice message history"
    },
    ["<leader>Nd"] = {
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "Dismiss all Noice notifications"
    },
  },
}

return M
