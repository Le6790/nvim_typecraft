return {
  "catppuccin/nvim",
  version = "v1.11.0",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
