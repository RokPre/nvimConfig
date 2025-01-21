return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Leader>a",
        accept_word = "<C-a>",
      },
      color = {
        suggestion_color = "#a66f59",
        cterm = 244,
      },
    })
  end,
}
