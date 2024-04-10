return {
	"catppuccin/nvim",
  commit="045e3499d9ec8d84635fb08877ae44fd33f6a38d",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
