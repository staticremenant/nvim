local M = {}

M.setup = function()
  vim.api.nvim_create_user_command('Q', function()
    vim.cmd("bufdo bwipeout")
    local nvim_tree_present, nvim_tree_api = pcall(require, "nvim-tree.api")
    if nvim_tree_present then
      nvim_tree_api.tree.close()
    end
    vim.cmd("qa")
  end, { desc = "Close all windows and quit Neovim" })

  vim.api.nvim_create_user_command('QF', function()
    vim.cmd("bufdo bwipeout!")
    local nvim_tree_present, nvim_tree_api = pcall(require, "nvim-tree.api")
    if nvim_tree_present then
      nvim_tree_api.tree.close()
    end
    vim.cmd("qa!")
  end, { bang = true, desc = "Force close all windows and quit Neovim" })
end

return M
