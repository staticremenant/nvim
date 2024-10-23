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
    end,
    config = function()
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
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
              "console",
            },
            size = 10,
            position = "bottom",
          },
        },
      })
      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
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

      vim.api.nvim_set_keymap('n', 'gtd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gtD', '<cmd>lua require("telescope.builtin").lsp_declarations()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gti', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gtr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tD', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>',
        { noremap = true, silent = true })
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
    require("custom.configs.quit").setup()
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    event = "BufEnter",
    config = function()
      require('git-conflict').setup(
        {
          default_mappings = true,
          default_commands = true,
          disable_diagnostics = false,
          list_opener = 'copen',
          highlights = {
            incoming = 'DiffAdd',
            current = 'DiffText',
          }
        }
      )
    end
  },
  {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' },
    event = "BufEnter",
    config = function()
      require("custom.configs.harpoon").setup()
    end
  }
}
return plugins
