vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
-- Setting up Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- plugins
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate"
  },
  {
  "nvim-tree/nvim-tree.lua",version = "*",
  lazy = false,dependencies = {
    "nvim-tree/nvim-web-devicons",
    }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

-- catppuccin theme
require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")

-- telescope 
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})


local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript", "python"},
    highlight = { enable = true },
    indent = { enable = true },
})
