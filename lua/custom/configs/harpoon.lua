local M = {}

function M.setup()
  require("harpoon").setup()

  vim.keymap.set('n', '<leader>a', function()
    require("harpoon.mark").add_file()
  end, { desc = "Add file to Harpoon" })

  vim.keymap.set('n', '<leader>m', function()
    require("harpoon.ui").toggle_quick_menu()
  end, { desc = "Open Harpoon menu with Telescope" })

  vim.keymap.set('n', '<leader>ca', function()
    require("harpoon.mark").cler_all()
  end, { desc = "Clears all buffers in Harpoon" })

  vim.keymap.set('n', '<leader>1', function()
    require("harpoon.ui").nav_file(1)
  end, { desc = "Go to Harpoon file 1" })
  vim.keymap.set('n', '<leader>2', function()
    require("harpoon.ui").nav_file(2)
  end, { desc = "Go to Harpoon file 2" })
  vim.keymap.set('n', '<leader>3', function()
    require("harpoon.ui").nav_file(3)
  end, { desc = "Go to Harpoon file 3" })
  vim.keymap.set('n', '<leader>4', function()
    require("harpoon.ui").nav_file(4)
  end, { desc = "Go to Harpoon file 4" })
  vim.keymap.set('n', '<leader>5', function()
    require("harpoon.ui").nav_file(5)
  end, { desc = "Go to Harpoon file 5" })
  vim.keymap.set('n', '<leader>6', function()
    require("harpoon.ui").nav_file(6)
  end, { desc = "Go to Harpoon file 6" })
  vim.keymap.set('n', '<leader>7', function()
    require("harpoon.ui").nav_file(7)
  end, { desc = "Go to Harpoon file 7" })
  vim.keymap.set('n', '<leader>8', function()
    require("harpoon.ui").nav_file(8)
  end, { desc = "Go to Harpoon file 8" })
  vim.keymap.set('n', '<leader>9', function()
    require("harpoon.ui").nav_file(9)
  end, { desc = "Go to Harpoon file 9" })
end

return M
