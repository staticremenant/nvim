local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "pbls",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy",
          }
        },
      }
    end,
    init = function()
      require("core.utils").load_mappings("telescope")
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("custom.configs.conform").setup()
    end,
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function()
      require("core.utils").load_mappings("gitsigns")
    end
  },
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    config = function(_, opts)
      require("go").setup(opts)
    end,
    event = { "CmdlineEnter" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    'rmagatti/goto-preview',
    config = function()
      require('custom.configs.goto-preview').setup()
    end,
  },
  {
    require("custom.configs.quit").setup()
  },
}
return plugins
