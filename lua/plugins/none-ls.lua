return {
	"nvimtools/none-ls.nvim",
  lazy = false,
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- use :Mason to install these formatters/linters
				-- lua
				null_ls.builtins.formatting.stylua,
				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pylint,
				-- JavaScript
				--null_ls.builtins.formatting.prettier,

        --bash
        null_ls.builtins.formatting.shellharden,

			},
		})

		vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, {})
	end,
}
