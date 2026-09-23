return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>pf", function() require("fzf-lua").files() end, desc = "Fzf Files" },
    { "<leader>pr", function() require("fzf-lua").oldfiles() end, desc = "Fzf Recent Files" },
    { "<leader>pt", function() require("fzf-lua").live_grep() end, desc = "Fzf Live Grep" },
    { "<leader>pb", function() require("fzf-lua").buffers() end, desc = "Fzf Buffers" },
    { "<leader>pm", function() require("fzf-lua").marks() end, desc = "Fzf Marks" },
  },
  config = function()
    require("fzf-lua").setup({
      winopts = {
        preview = {
          layout = "horizontal",
          horizontal = "right:50%",
        },
      },
      previewers = {
        builtin = {
          render_markdown = { enabled = false },
        },
      },
    })
  end,
  -- Keymaps in vim-keymaps.lua
}
