return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      vim.keymap.set("n", "<leader>a", function()
        require("harpoon.mark").add_file()
      end, { desc = "Add file to Harpoon" })

      vim.keymap.set("n", "<leader>m", function()
        require("harpoon.ui").toggle_quick_menu()
      end, { desc = "Toggle Harpoon menu" })

      vim.keymap.set("n", "<leader>1", function()
        require("harpoon.ui").nav_file(1)
      end, { desc = "Navigate to Harpoon file 1" })
      vim.keymap.set("n", "<leader>2", function()
        require("harpoon.ui").nav_file(2)
      end, { desc = "Navigate to Harpoon file 2" })
      vim.keymap.set("n", "<leader>3", function()
        require("harpoon.ui").nav_file(3)
      end, { desc = "Navigate to Harpoon file 3" })
      vim.keymap.set("n", "<leader>4", function()
        require("harpoon.ui").nav_file(4)
      end, { desc = "Navigate to Harpoon file 4" })
      vim.keymap.set("n", "<leader>5", function()
        require("harpoon.ui").nav_file(5)
      end, { desc = "Navigate to Harpoon file 5" })
    end,
  }
}
