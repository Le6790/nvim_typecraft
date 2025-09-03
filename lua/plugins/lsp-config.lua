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
				ensure_installed = { "lua_ls", "pyright", "bashls", "marksman", "perlnavigator", "ts_ls" },
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
