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
      vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, {})
      vim.keymap.set("n", "<leader>ph", require("gitsigns").preview_hunk, {})
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
      vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git Pull" })
      vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git Add all" })
      vim.keymap.set("n", "<leader>gds", ":Gdiffsplit <CR>", { desc = "Git Diff Split" })
      vim.keymap.set("n", "<leader>ggr", ":diffget //3 <CR>", { desc = "Git Get Right" })
      vim.keymap.set("n", "<leader>ggl", ":diffget //2 <CR>", { desc = "Git Get Left" })
    end,
  },
}
