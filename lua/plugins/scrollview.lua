return {
  "dstein64/nvim-scrollview",
  commmit="5a7eb7e6c1b921761615b57a6140d73b1cc2b034",
  config = function()
    require("scrollview").setup({
      excluded_filetypes = { "nerdtree" },
      current_only = true,
      base = "right",
      signs_on_startup = { "all" },
      -- diagnostics_severities = { vim.diagnostic.severity.ERROR },
    })
  end,
}
