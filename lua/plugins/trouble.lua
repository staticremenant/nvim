return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        use_diagnostic_signs = true,
      })

      vim.keymap.set("n", "<leader>tw", "<cmd>Trouble diagnostics toggle focus=true<CR>", {})
      vim.keymap.set("n", "<leader>tb", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>", {})
    end,
  },
}
