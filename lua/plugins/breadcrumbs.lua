return {
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufRead",
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true,
        },
      })
      require("barbecue").setup({
        show_modified = true,
        theme = "auto",
      })
    end,
  },
}
