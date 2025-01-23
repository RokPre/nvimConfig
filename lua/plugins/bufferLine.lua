return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        -- https://github.com/rewhile/CatNvim/blob/33f8c15bb44a61ce35617675c7bdc44fed625621/lua/plugins/bufferline.lua
        -- Add config here
      }
    })
  end
}

