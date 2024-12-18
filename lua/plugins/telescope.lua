return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			-- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>pb", builtin.buffers, {})

			-- vim.keymap.set(
			--   "n",
			--   "<leader>pb",
			--   "<cmd>Telescope buffers sort_lastused=true initial_mode=normal theme=ivy<cr>",
			--   { desc = "open telescope buffers" }
			-- )
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
					},
					buffers = {
						theme = "ivy",
					},
				},
				layout_config = {
					preview_cutoff = 10,
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
