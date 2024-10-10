local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = true,
    border = "rounded",
  },
})

vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

local custom_on_attach = function(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local group_name = "LspDocumentHighlight_" .. bufnr
    vim.api.nvim_create_augroup(group_name, { clear = true })

    vim.api.nvim_create_autocmd("CursorHold", {
      group = group_name,
      buffer = bufnr,
      callback = function()
        vim.schedule(vim.lsp.buf.document_highlight)
      end,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group_name,
      buffer = bufnr,
      callback = function()
        vim.schedule(vim.lsp.buf.clear_references)
      end,
    })
  end

  if on_attach then
    on_attach(client, bufnr)
  end
end

vim.api.nvim_set_hl(0, "LspReferenceText", { fg = "#a6ffbf", underline = true })
vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#a6ffbf", underline = true })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#a6ffbf", underline = true })

lspconfig.gopls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  handlers = {
    ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      if result.diagnostics == nil then
        return
      end
      config = config or {}
      config.virtual_text = false
      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
}

lspconfig.pbls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
}
