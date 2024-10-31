return {
  {
    'mbbill/undotree',
    event = "BufEnter",
    config = function()
      vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undotree" })
    end
  },
}
