local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local themes = require('telescope.themes')

local custom_buffer = function()
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

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = themes.get_ivy({
          initial_mode = "insert",
          previewer = true,
        }),
      })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", custom_buffer, {})
      vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status theme=ivy <CR>", {})
      vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", {})


      require("telescope").load_extension("ui-select")
    end,
  },
}
