return {
  'akinsho/bufferline.nvim', version = "*",
  -- commit="64e2c5def50dfd6b6f14d96a45fa3d815a4a1eef",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup{}
  end
}
