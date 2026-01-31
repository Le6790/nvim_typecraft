return {
  {
    "williamboman/mason.nvim",
    version = "v2.0.1",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "v2.0.1",
    config = function()
      require("mason-lspconfig").setup({
        -- Add language servers here
        ensure_installed = { "lua_ls", "pyright", "ruff", "bashls", "marksman", "perlnavigator", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    version = "v2.4.0",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- Setup language servers here

      -- LUA
      -- Lua language server
      -- formatter - stylua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- TYPESCRIPT
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- PYTHON
      -- Use pyright for type checking
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Let ruff handle import organization
            disableOrganizeImports = true,
          },
        },
      })
      -- Use ruff for linting/diagnostics
      lspconfig.ruff.setup({
        capabilities = capabilities,
      })

      -- BASH
      -- Bash language server
      -- formatter/linter - shellharden
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      -- MARKDOWN
      -- markdown language server
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })


      -- PERL
      lspconfig.perlnavigator.setup({
        capabilities = capabilities,
        settings = {
          perlPath = "perl",
          enableWarnings = true,
          -- perltidyProfile = "",
          -- perlcriticProfile = "",
          perlcriticEnable = false,
        },
      })
      -- Keymaps moved to vim-keymaps.lua (LspAttach autocmd)
    end,
  },
}
