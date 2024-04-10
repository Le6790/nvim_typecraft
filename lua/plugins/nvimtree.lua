return {
  "nvim-tree/nvim-tree.lua",
  commit="707b24af91a1d05823099ed8c5450796290466ba",
  lazy = false,dependencies = {
    "nvim-tree/nvim-web-devicons",
    },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end

  }
