return {
  "levouh/tint.nvim",
  commit = "586e87f00c8b0f5e857cefe10839e41f3e8c6d01",
  lazy = false,
  config = function()
    require("tint").setup({
      tint = -45,
      saturation = 0.6,
      transforms = require("tint").transforms.SATURATE_TINT,   -- Showing default behavior, but value here can be predefined set of transforms
      tint_background_colors = false,                           -- Tint background portions of highlight groups
      highlight_ignore_patterns = { "WinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
      window_ignore_function = function(winid)
        local bufid = vim.api.nvim_win_get_buf(winid)
        local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
        local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

        -- Do not tint `terminal` or floating windows, tint everything else
        return buftype == "terminal" or floating
      end,
    })
  end,
}
