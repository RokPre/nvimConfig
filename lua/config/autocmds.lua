-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Enable spell checking for .tex files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    -- Enable spell checking
    vim.opt_local.spell = true

    -- Set spelllang to both English and Slovenian
    vim.opt_local.spelllang = { "en_us", "sl" }
  end,
})
