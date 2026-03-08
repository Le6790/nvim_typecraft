return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				preview = {
					layout = "horizontal",
					horizontal = "right:50%",
				},
			},
			previewers = {
				builtin = {
					render_markdown = { enabled = false },
				},
			},
		})
	end,
	-- Keymaps in vim-keymaps.lua
}
