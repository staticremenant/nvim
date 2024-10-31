vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set signcolumn=yes")
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

local signs = { Error = "", Warn = "▲", Hint = "⚑", Info = "ℹ" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
