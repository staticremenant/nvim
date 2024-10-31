return {
  {
    "zbirenbaum/nvterm",
    config = function(_, opts)
      -- require "base46.term"
      opts.terminals = opts.terminals or {}
      opts.terminals.type_opts = opts.terminals.type_opts or {}
      opts.terminals.type_opts.horizontal = opts.terminals.type_opts.horizontal or {}
      opts.terminals.type_opts.horizontal.split_ratio = 0.37
      require("nvterm").setup(opts)
      vim.keymap.set("t", "<C-i>", function()
        require("nvterm.terminal").toggle "float"
      end, {})
      vim.keymap.set("t", "<C-h>", function()
        require("nvterm.terminal").toggle "horizontal"
      end, {})

      vim.keymap.set("n", "<leader>i", function()
        require("nvterm.terminal").toggle "float"
      end, {})
      vim.keymap.set("n", "<leader>h", function()
        require("nvterm.terminal").toggle "horizontal"
      end, {})
    end,
  },
}
