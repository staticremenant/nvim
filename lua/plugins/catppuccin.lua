return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
      vim.cmd([[
        hi InfoMsg guifg=#5fafff guibg=NONE ctermfg=75
        hi HintMsg guifg=#afff5f guibg=NONE ctermfg=107
      ]])
    end
  }
}
