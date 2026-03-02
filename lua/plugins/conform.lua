return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        lua = { "stylua" },
        bash = { "shellharden" },
        sh = { "shellharden" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
      },

      -- Formatter-specific options
      formatters = {
        ruff_format = {
          args = { "format", "--stdin-filename", "$FILENAME", "-" },
        },
        stylua = {
          args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
        },
        prettier = {
          args = { "--stdin-filepath", "$FILENAME" },
        },
      },
    })

    -- Manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range" })
  end,
}
