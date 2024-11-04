return {
  {
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup({
        {
          dir = vim.fn.stdpath("state") .. "/sessions/",
          need = 1,
          branch = true,
        },
      })
      vim.keymap.set("n", "<leader>ls", function() require("persistence").load() end)
      vim.keymap.set("n", "<leader>qs", function() require("persistence").stop() end)
    end,
  },
}
