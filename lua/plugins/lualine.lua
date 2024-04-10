return {
  "nvim-lualine/lualine.nvim",
  commit="af4c3cf17206810880d2a93562e0a4c0d901c684",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
      },
    })
  end,
}
