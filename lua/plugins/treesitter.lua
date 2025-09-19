return {
  "nvim-treesitter/nvim-treesitter",
  release = "v0.10.0",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = false,
      ensure_installed = { "lua", "python", "markdown", "markdown_inline", "perl" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
