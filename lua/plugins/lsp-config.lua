return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Add language servers here
        ensure_installed = { "lua_ls", "tsserver", "pyright" }
    })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Setup language servers here
      lspconfig.lua_ls.setup({})   -- Lua language server
      lspconfig.tsserver.setup({}) -- TypScript language server
      lspconfig.pyright.setup({})  -- Pyright language server

      -- Set keymaps here  
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})

    end


  }
}
