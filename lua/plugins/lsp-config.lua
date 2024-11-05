local last_echo = { false, -1, -1 }
local echo_timer = nil
local echo_timeout = 30
local warning_hlgroup = 'WarningMsg'
local error_hlgroup = 'ErrorMsg'
local info_hlgroup = 'InfoMsg'
local hint_hlgroup = 'HintMsg'
local short_line_limit = 20

local function echo_diagnostic()
  if echo_timer then
    echo_timer:stop()
  end

  echo_timer = vim.defer_fn(
    function()
      local line = vim.fn.line('.') - 1
      local bufnr = vim.api.nvim_win_get_buf(0)

      if last_echo[1] and last_echo[2] == bufnr and last_echo[3] == line then
        return
      end

      local diags = vim.diagnostic.get(bufnr, {
        lnum = line,
        -- severity = {
        --   min = vim.diagnostic.severity.WARN,
        -- },
      })

      if #diags == 0 then
        if last_echo[1] then
          last_echo = { false, -1, -1 }

          vim.api.nvim_command('echo ""')
        end

        return
      end

      last_echo = { true, bufnr, line }

      local diag = diags[1]
      local width = vim.api.nvim_get_option('columns') - 15
      local lines = vim.split(diag.message, "\n")
      local message = lines[1]
      local trimmed = false

      if #lines > 1 and #message <= short_line_limit then
        message = message .. ' ' .. lines[2]
      end

      if width > 0 and #message >= width then
        message = message:sub(1, width) .. '...'
      end

      local kind = 'warning'
      local hlgroup = warning_hlgroup

      if diag.severity == vim.diagnostic.severity.ERROR then
        kind = 'error'
        hlgroup = error_hlgroup
      elseif diag.severity == vim.diagnostic.severity.INFO then
        kind = 'info'
        hlgroup = info_hlgroup
      elseif diag.severity == vim.diagnostic.severity.HINT then
        kind = 'hint'
        hlgroup = hint_hlgroup
      end

      local chunks = {
        { kind .. ': ', hlgroup },
        { message }
      }

      vim.api.nvim_echo(chunks, false, {})
    end,
    echo_timeout
  )
end

return {
  {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local util = require "lspconfig/util"
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.gopls.setup {
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        handlers = {
          ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            if result.diagnostics == nil then
              return
            end
            config = config or {}
            config.virtual_text = false
            vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
          end,
        },
      }

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          source = true,
          border = "rounded",
        },
      })

      vim.api.nvim_create_autocmd("CursorMoved", {
        pattern = "*",
        callback = function()
          echo_diagnostic()
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float { border = "rounded" }
      end, { desc = "Floating diagnostic" })

      vim.keymap.set("n", "<leader>D", function()
        vim.lsp.buf.type_definition()
      end, { desc = "Definition type" })
    end,
  },
}
