return {
	"nvimtools/none-ls.nvim",
	commit = "53ec77181d96494b9dc9457110dd62dc623cc78d", -- 2025-09-02
	lazy = false,
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- use :Mason to install these formatters/linters
				-- lua
				null_ls.builtins.formatting.stylua, -- install via :Mason

				-- python
				null_ls.builtins.formatting.black, -- install via :Mason
				null_ls.builtins.formatting.isort, -- install via :Mason
				-- null_ls.builtins.diagnostics.pylint, -- install via :Mason, If using pyright, don't need to enable

				-- JavaScript
				null_ls.builtins.formatting.prettier, -- install via :Mason

				--bash
				null_ls.builtins.formatting.shellharden, -- cargo install shellharden

				--markdown
				--null_ls.builtins.diagnostics.markdownlint, -- install via :Mason
				--null_ls.builtins.formatting.mdformat -- install via :Mason
			},
		})

		vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, {})
	end,
}
