return {
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        },
      })

      vim.keymap.set("n", "]h", function()
        if vim.wo.diff then
          return "]h"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end, {})
      vim.keymap.set("n", "[h", function()
        if vim.wo.diff then
          return "[h"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end, {})

      vim.keymap.set("n", "<leader>rh", require("gitsigns").reset_hunk, {})
      vim.keymap.set("n", "<leader>td", require("gitsigns").toggle_deleted, {})
      vim.keymap.set("n", "<leader>bl", require("gitsigns").blame_line, {})
      vim.keymap.set("n", "<leader>ph", require("gitsigns").preview_hunk, {})
    end
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    event = "BufReadPost",
    config = function()
      require('git-conflict').setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        list_opener = 'copen',
        highlights = {
          incoming = 'DiffAdd',
          current = 'DiffText',
        }
      })
    end
  },

}
