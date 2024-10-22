local M = {}

M.setup = function()
  require("conform").setup({
    formatters_by_ft = {
      go = { "gofmt", "goimports" },
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
end

return M
