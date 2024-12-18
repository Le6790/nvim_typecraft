return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			render_modes = { "n", "c", "t", "i", "v", "V" }, -- controls which vim mode allows the rendered view :h mode() for other modes
			code = {
				enabled = true,
				sign = true,
				style = "full",
				position = "left",
				language_name = true,
				disable_background = { "diff" },
				width = "block",
				min_width = 45,
				left_pad = 2,
				right_pad = 2,
				language_pad = 2,
				border = "thin",
				above = "▄",
				below = "▀",
				highlight = "RenderMarkdownCode",
				highlight_inline = "RenderMarkdownCodeInline",
				highlight_language = nil,
			},
			checkbox = {
				enabled = true,
				position = "inline",
				unchecked = {
					icon = "󰄱 ",
					highlight = "RenderMarkdownUnchecked",
					scope_highlight = nil,
				},
				checked = {
					icon = "󰱒 ",
					highlight = "RenderMarkdownChecked",
					scope_highlight = nil,
				},
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				},
			},
		})
	end,
}
