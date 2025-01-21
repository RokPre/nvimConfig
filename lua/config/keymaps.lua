local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
local modes = {"n", "i", "v", "t", "o"}
local noimodes = {"n", "i", "v", "t", "o"}

local wk = require("which-key")

-- Navigation
keymap(noimodes, "gh", "^", opts)
keymap(noimodes, "gl", "$", opts)
wk.add({
  { "gh", desc = "Beginning of line", mode = noimodes },
  { "gl", desc = "End of line", mode = noimodes },
})

-- Move text
keymap("n", "<C-j>", ":m .+1<CR>==", opts) -- move line up(n)
keymap("n", "<C-k>", ":m .-2<CR>==", opts) -- move line down(n)
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts) -- move line up(v)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts) -- move line down(v)

-- TODO: readd from my original github config
