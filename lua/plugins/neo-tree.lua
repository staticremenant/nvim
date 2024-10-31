return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      enable_git_status = true,
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
      default_component_configs = {
        diagnostics = {
          symbols = {
            hint = "⚑",
            info = "ℹ",
            warn = "▲",
            error = "",
          },
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          },
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", {})

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        local events = require("neo-tree.events")
        events.fire_event(events.GIT_EVENT)
      end,
    })
  end,
}
