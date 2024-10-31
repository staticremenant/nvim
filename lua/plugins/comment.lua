return {
  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      require("Comment").setup(opts)

      vim.keymap.set("n", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        {})
      vim.keymap.set("v", "<leader>/", function()
        require("Comment.api").toggle.linewise.current()
      end, {})
    end,
  },
}
