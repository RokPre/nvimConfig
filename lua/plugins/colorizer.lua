return {
  -- Other plugins here
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Enable for all file types
      })
    end,
  },
}
