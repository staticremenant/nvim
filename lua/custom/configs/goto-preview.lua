local M = {}

M.setup = function()
  require('goto-preview').setup {
    width = 120,
    height = 25,
    default_mappings = false,
    border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
    debug = false,
    opacity = nil,
    resizing_mappings = false,
    post_open_hook = nil,
    references = {
      telescope = require("telescope.themes").get_ivy({ hide_preview = false })
    },
    focus_on_open = true,
  }
end

return M
