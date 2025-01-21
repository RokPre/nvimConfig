return {
  "SirVer/ultisnips",
  event = "VeryLazy",
  config = function()
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "/home/lasim/sync/dotFiles/nvim/ultiSnips" }
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
  end,
}
