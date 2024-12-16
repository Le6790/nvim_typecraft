return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- use :Mason to install these formatters/linters
				-- lua
				null_ls.builtins.formatting.stylua, -- install via :Mason
				-- python
				null_ls.builtins.formatting.black, -- pip install black
				null_ls.builtins.formatting.isort, -- pip install isort if not satisfied
				null_ls.builtins.diagnostics.pylint, -- pip install pylint
				-- JavaScript
				--null_ls.builtins.formatting.prettier,

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
