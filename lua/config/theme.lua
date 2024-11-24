local c = {
  bg = "#22273E",
  bgLight = "#4e4f5e",
  text = "#ffffff",
  textMuted = "#a6adc8",
  term = {
    normal = {
      Black = "#000000",
      Red = "#ff5555",
      Green = "#50fa7b",
      Yellow = "#f1fa8c",
      Blue = "#caa9fa",
      Magenta = "#ff79c6",
      Cyan = "#8be9fd",
      White = "#bfbfbf",
    },
    bright = {
      Black = "#7f849c",
      Red = "#ff6e6e",
      Green = "#69ff94",
      Yellow = "#ffffa5",
      Blue = "#d6acff",
      Magenta = "#ff92df",
      Cyan = "#a4ffff",
      White = "#e6e6e6",
    },
    dark = {
      Black = "#000000",
      Red = "#ff6e6e",
      Green = "#69ff94",
      Yellow = "#ffffa5",
      Blue = "#d6acff",
      Magenta = "#ff92df",
      Cyan = "#a4ffff",
      White = "#e6e6e6",
    },
  },

  primary = {
    base = "#ff79c6",
    bright = "#bd93f9",
    dim = "#945eb8",
  },
  secondary = {
    base = "#50fa7b",
    bright = "#8be9fd",
    dim = "#69ff94",
  },
  tertiary = {
    base = "#f1fa8c",
    bright = "#ffffa5",
    dim = "#f6c177",
  },

  neutral = {
    base = "#e6e6e6",
    bright = "#d6acff",
    dim = "#945eb8",
  },
}

vim.cmd("hi CmpItemKindSupermaven guifg=" .. c.textMuted)
vim.cmd("hi Normal guibg=" .. c.bg)
vim.cmd("hi CursorLine guibg=" .. c.bgLight)

-- all The backgrounds
vim.cmd("hi EndOfBuffer guibg=" .. c.bg)
vim.cmd("hi FoldColumn guibg=" .. c.bg)
vim.cmd("hi SignColumn guibg=" .. c.bg)
vim.cmd("hi NormalNC guibg=" .. c.bg)
vim.cmd("hi Cursor guibg=" .. c.bg)
vim.cmd("hi lCursor guibg=" .. c.bg)
vim.cmd("hi CursorIM guibg=" .. c.bg)
vim.cmd("hi Normal guibg=" .. c.bg)
vim.cmd("hi Todo guibg=" .. c.bg)
vim.cmd("hi NotifyTRACEBody guibg=" .. c.bg)
vim.cmd("hi NotifyTRACEBorder guibg=" .. c.bg)
vim.cmd("hi NotifyERRORBody guibg=" .. c.bg)
vim.cmd("hi NotifyWARNBorder guibg=" .. c.bg)
vim.cmd("hi NeoTreeTabSeparatorInactive guibg=" .. c.bg)
vim.cmd("hi NotifyERRORBorder guibg=" .. c.bg)
vim.cmd("hi NotifyDEBUGBorder guibg=" .. c.bg)
vim.cmd("hi NotifyINFOBorder guibg=" .. c.bg)
vim.cmd("hi NotifyWARNBody guibg=" .. c.bg)
vim.cmd("hi NotifyINFOBody guibg=" .. c.bg)
vim.cmd("hi NotifyDEBUGBody guibg=" .. c.bg)
vim.cmd("hi NotifyBackground guibg=" .. c.bg)
vim.cmd("hi TodoBgTODO guibg=" .. c.bg)
vim.cmd("hi TodoSignTODO guibg=" .. c.bg)
vim.cmd("hi TodoBgTEST guibg=" .. c.bg)
vim.cmd("hi TodoSignTEST guibg=" .. c.bg)
vim.cmd("hi TodoSignFIx guibg=" .. c.bg)
vim.cmd("hi TodoBgWARN guibg=" .. c.bg)
vim.cmd("hi TodoSignWARN guibg=" .. c.bg)
vim.cmd("hi TodoBgNOTE guibg=" .. c.bg)
vim.cmd("hi TodoSignNOTE guibg=" .. c.bg)
vim.cmd("hi TodoBgHACK guibg=" .. c.bg)
vim.cmd("hi TodoSignHACK guibg=" .. c.bg)
vim.cmd("hi TodoBgPERF guibg=" .. c.bg)
vim.cmd("hi TodoSignPERF guibg=" .. c.bg)
vim.cmd("hi BufferLineInfoDiagnosticSelecte guibg=" .. c.bg)
vim.cmd("hi BufferLineInfoSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineHintDiagnosticSelecte guibg=" .. c.bg)
vim.cmd("hi BufferLineDiagnosticSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineNumbersSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineBufferSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineCloseButtonSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineTabSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineHintSelected guibg=" .. c.bg)
vim.cmd("hi BufferLinePickSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineTabSeparatorSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineSeparatorSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineDuplicateSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineModifiedSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineErrorDiagnosticSelecte guibg=" .. c.bg)
vim.cmd("hi BufferLineErrorSelected guibg=" .. c.bg)
vim.cmd("hi BufferLineWarningDiagnosticSelecte guibg=" .. c.bg)
vim.cmd("hi BufferLineWarningSelected guibg=" .. c.bg)
vim.cmd("hi NoiceAttr61 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr62 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr82 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr83 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr103 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr105 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr111 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr117 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr122 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr123 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr124 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr136 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr170 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr171 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr172 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr173 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr175 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr176 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr177 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr178 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr179 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr181 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr184 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr186 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr189 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr190 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr192 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr193 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr202 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr205 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr207 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr211 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr212 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr214 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr216 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr217 guibg=" .. c.bg)
vim.cmd("hi NoiceAttr219 guibg=" .. c.bg)

vim.cmd("hi CursorLineNr guifg=#ff966c")
vim.cmd("hi LineNrAbove guifg=#a66f59")
vim.cmd("hi LineNrBelow guifg=#cc8366")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
