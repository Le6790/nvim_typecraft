return {
  {
    "williamboman/mason.nvim",
    commit = "3b5068f0fc565f337d67a2d315d935f574848ee7",
    config = function()
      require("mason").setup({
        ensure_installed = { "black", "isort", "pylint", "shellharden" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "2ba17cecfde8b8c7c7c287909a1e4de895223df6",
    config = function()
      require("mason-lspconfig").setup({
        -- Add language servers here
        ensure_installed = { "lua_ls", "pyright", "bashls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    commit = "d67715d3b746a19e951b6b0a99663fa909bb9e64",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- Setup language servers here
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      }) -- Lua language server
      lspconfig.pyright.setup({
        filetypes = { "python" },
        capabilities = capabilities,
      }) -- Pyright language server
      lspconfig.bashls.setup({
        capabilities = capabilities,
      }) -- Bash language server

      -- Set keymaps here
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "ge", vim.diagnostic.open_float)
      vim.keymap.set("n", "gs", vim.diagnostic.show)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
