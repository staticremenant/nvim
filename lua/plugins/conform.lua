return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          go = { "gofmt", "goimports", },
          lua = { "stylua" },
        },

        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          require("conform").format({ async = true })
        end,
      })
    end,
    event = "VeryLazy",

    vim.keymap.set("n", "<leader>gf", function()
      require("conform").format()
    end, { desc = "Format code with Conform" })
  },
}
