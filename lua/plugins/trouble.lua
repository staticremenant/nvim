return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        use_diagnostic_signs = true,
      })

      vim.keymap.set("n", "<leader>tw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble" })
      vim.keymap.set("n", "<leader>tb", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>", {})
    end,
  },
}
