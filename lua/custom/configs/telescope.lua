local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local themes = require('telescope.themes')

local m = {}

m.custom_buffer = function()
  builtin.buffers(themes.get_ivy({
    initial_mode = "normal",
    previewer = true,
    sort_lastused = true,
    sort_mru = true,
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        current_picker:delete_selection(function(selection)
          vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        end)
      end

      map('n', 'd', delete_buf)

      return true
    end,
  }))
end

return m
