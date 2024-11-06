return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        use_diagnostic_signs = true,
      })

      vim.keymap.set("n", "<leader>xw", "<cmd><cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })
      vim.keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>", {})
    end,
  },
}
