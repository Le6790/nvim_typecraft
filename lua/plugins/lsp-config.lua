return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "black", "isort" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Add language servers here
        ensure_installed = { "lua_ls", "tsserver", "pyright", "bashls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- Setup language servers here
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      }) -- Lua language server
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      }) -- TypScript language server
      lspconfig.pyright.setup({
        filetypes = { "python" },
        capabilities = capabilities,
      })-- Pyright language server
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })-- Bash language server

      -- Set keymaps here
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
      vim.keymap.set('n', 'gs', vim.diagnostic.show)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})


    end,
  },
}
