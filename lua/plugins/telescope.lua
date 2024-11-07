local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local themes = require('telescope.themes')

local custom_buffer = function()
  builtin.buffers(themes.get_ivy({
    initial_mode = "normal",
    previewer = true,
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filename_first_smart(_, path)
  local tail = vim.fs.basename(path)
  local relative_path = vim.fn.fnamemodify(path, ":~:.")
  return string.format("%s\t\t%s", tail, relative_path)
end

local function quote_with_iglob()
  local prompt_bufnr = vim.api.nvim_get_current_buf()
  require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob **//**" })(prompt_bufnr)
  local prompt_text = vim.api.nvim_buf_get_lines(prompt_bufnr, 0, 1, false)[1] or ""
  local cursor_pos = #prompt_text - 3
  vim.api.nvim_win_set_cursor(0, { 1, cursor_pos })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
    cmd = { "Telescope" },
    config = function()
      require("telescope").setup({
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
                ["<C-o>"] = quote_with_iglob,
              },
            },
          },
        },
        defaults = themes.get_ivy({
          path_display = filename_first_smart,
          initial_mode = "insert",
          previewer = true,
          vimgrep_arguments = {
            "rg",
            "-L",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        }),
      })

      require("telescope").load_extension("live_grep_args")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
      vim.keymap.set("n", "<leader>fb", custom_buffer, {})
      vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", {})
      vim.keymap.set('n', '<leader>ds', '<cmd> Telescope lsp_document_symbols<CR>', {})

      vim.keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", {})
      vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status theme=ivy <CR>", {})

      vim.keymap.set("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", {})
      vim.keymap.set("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations({ show_line=false })<CR>", {})
      vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references({ show_line=false })<CR>", {})
    end,
  },
}
