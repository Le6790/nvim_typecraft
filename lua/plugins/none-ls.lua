return {
  enabled= false,
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

				-- JavaScript
				null_ls.builtins.formatting.prettier, -- install via :Mason

				--bash
				null_ls.builtins.formatting.shellharden, -- cargo install shellharden

				--markdown
				--null_ls.builtins.diagnostics.markdownlint, -- install via :Mason
				--null_ls.builtins.formatting.mdformat -- install via :Mason
			},
		})

		-- Keymap moved to vim-keymaps.lua
	end,
}
