return {
  {
    'mbbill/undotree',
    event = "BufRead",
    config = function()
      vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undotree" })
    end
  },
}
