local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})

vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

local custom_on_attach = function(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "LspDocumentHighlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "LspDocumentHighlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
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
}

lspconfig.pbls.setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
}
