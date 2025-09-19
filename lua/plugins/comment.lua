-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
  "numToStr/Comment.nvim",
  --commit="0236521ea582747b58869cb72f70ccfa967d2e89",
  tag = "v0.8.0",
  opts = {
    -- add any options here
  },
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {})
    vim.keymap.set("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {})
  end,
}
