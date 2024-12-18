return {
	"junegunn/fzf.vim",
	commit = "e69f2dcdad44e7eafe764969ed7281d7290db18f",
	dependencies = {
		"junegunn/fzf",
		commit = "5e47ab94318a0a43b253bd09b5a18ef61cd7de1b",
	},
	config = function()
		vim.keymap.set("n", "<leader>pf", ":Files<CR>")
		vim.keymap.set("n", "<leader>pr", ":History<CR>")
		vim.keymap.set("n", "<leader>pt", ":Rg<CR>")
		vim.keymap.set("n", "<leader>pb", ":Buffers<CR>")
	end,
}
