return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = false,
      ensure_installed = { "lua", "python", "markdown", "markdown_inline" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
