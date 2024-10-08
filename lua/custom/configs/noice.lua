local M = {}

M.setup = function()
  require("noice").setup({
    cmdline = {
      enabled = true,
    },
    messages = {
      enabled = true,
    },
    popupmenu = {
      enabled = true,
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        enabled = true,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  })
end

return M
