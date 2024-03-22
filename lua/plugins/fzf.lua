return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
  },
  config = function()
    vim.keymap.set("n", "<leader>pf", ":Files<CR>")
    vim.keymap.set("n", "<leader>pr", ":History<CR>")
    vim.keymap.set("n", "<leader>pt", ":Rg <CR>")
  end,
}
