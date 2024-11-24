return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  opts = {
    latex = {
      enabled = true, -- Ensure LaTeX rendering is enabled
      converter = "latex2text", -- Set the converter (could also be 'katex' or another)
      highlight = "RenderMarkdownMath", -- Define highlight group for LaTeX
      top_pad = 0,
      bottom_pad = 0,
      remove_latex_code = true,
      remove_latex_sections = true,
      latex_to_unicode = true,
      unicode_syntax = true,
    },
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
