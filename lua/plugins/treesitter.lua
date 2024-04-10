return {
  "nvim-treesitter/nvim-treesitter",
  commit="4d76587eeca434a47f460fb7f1c900de49400688",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = false,
      ensure_installed = { "lua", "python" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
