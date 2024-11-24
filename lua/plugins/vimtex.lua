return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  config = function()
    vim.g.vimtex_view_method = "zathura" -- Use zathura as the PDF viewer
    vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for compilation
    vim.g.vimtex_quickfix_mode = 0 -- Disable quickfix window by default
  end,
}
