local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
local modes = {"n", "i", "v", "t", "o"}
local noimodes = {"n", "v", "t", "o"}

local wk = require("which-key")

-- Navigation
keymap(noimodes, "gh", "^", opts)
keymap(noimodes, "gl", "$", opts)
wk.add({
  { "gh", desc = "Beginning of line", mode = noimodes },
  { "gl", desc = "End of line", mode = noimodes },
})

-- Scroll
-- Vertical scroll is handled by neoscroll plugin
keymap(modes, "<A-s>", "z<Left>", opts)
keymap(modes, "<A-g>", "z<Right>", opts)

-- Move text
keymap("n", "<C-j>", ":m .+1<CR>==", opts) -- move line up(n)
keymap("n", "<C-k>", ":m .-2<CR>==", opts) -- move line down(n)
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts) -- move line up(v)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts) -- move line down(v)

keymap("v", ">", ">gv", opts) -- indent right
keymap("v", "<", "<gv", opts) -- indent left 

-- Undo/redo
keymap(modes, "<S-u>", "<C-r>", opts)

-- Save C-s
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)

-- Search
keymap("n", "<C-f>", "*", opts)
keymap("v", "<C-f>", '"zy/<C-R>z<CR>', opts)

-- Upercase/downcase
keymap("n", "<C-u>", "~", opts)
keymap("v", "<C-u>", "~", opts)

-- Chera highlight
keymap("n", "<Esc>", ":noh<CR>", {noremap = false, silent = true})

-- Disable default behavior of 'd' to not copy to clipboard
keymap("n", "d", '"0d', opts) -- Normal mode
keymap("v", "d", '"0d', opts) -- Visual mode
keymap("n", "D", '"0D', opts) -- Normal mode
keymap("v", "D", '"0D', opts) -- Visual mode
keymap("n", "x", '"0x', opts) -- Normal mode
keymap("v", "x", '"0x', opts) -- Visual mode

keymap("n", "p", '"0p', opts) -- Normal mode
keymap("v", "p", '"0p', opts) -- Visual mode
keymap("n", "P", '"0P', opts) -- Normal mode
keymap("v", "p", '"0P', opts) -- Visual mode

-- Buffers
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("i", "<C-h>", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap("i", "<C-l>", ":BufferLineCycleNext<CR>", opts)

keymap("n", "<C-w>", ":BufferLinePickClose<CR>", opts)
keymap("i", "<C-w>", ":BufferLinePickClose<CR>", opts)

keymap("n", "<A-q>", ":BufferLineCloseLeft<CR>", opts)
keymap("i", "<A-q>", ":BufferLineCloseLeft<CR>", opts)

keymap("n", "<A-e>", ":BufferLineCloseRight<CR>", opts)
keymap("i", "<A-e>", ":BufferLineCloseRight<CR>", opts)

keymap("n", "<C-e>", ":BufferLinePick<CR>", opts)
keymap("i", "<C-e>", ":BufferLinePick<CR>", opts)

-- Windows
-- Navigate between windows
keymap("n", "<A-h>", ":wincmd h<CR>", opts)
keymap("n", "<A-j>", ":wincmd j<CR>", opts)
keymap("n", "<A-k>", ":wincmd k<CR>", opts)
keymap("n", "<A-l>", ":wincmd l<CR>", opts)

keymap("t", "<A-h>", [[<C-\><C-n>:wincmd h<CR>]], opts)
keymap("t", "<A-j>", [[<C-\><C-n>:wincmd j<CR>]], opts)
keymap("t", "<A-k>", [[<C-\><C-n>:wincmd k<CR>]], opts)
keymap("t", "<A-l>", [[<C-\><C-n>:wincmd l<CR>]], opts)

-- Create new windows
keymap("n", "<A-v>", ":wincmd v<CR>", opts)
keymap("n", "<A-b>", ":wincmd s<CR>", opts)

-- Clsoe window
keymap("n", "<A-w>", ":close<CR>", opts)

-- Move windows around
keymap("n", "<A-S-h>", ":wincmd H<CR>", opts)
keymap("n", "<A-S-j>", ":wincmd J<CR>", opts)
keymap("n", "<A-S-k>", ":wincmd K<CR>", opts)
keymap("n", "<A-S-l>", ":wincmd L<CR>", opts)

-- Resize windows
keymap("n", "<A-+>", ":wincmd +<CR>", opts)
keymap("n", "<A-->", ":wincmd -<CR>", opts)
keymap("n", "<A-*>", ":wincmd ><CR>", opts)
keymap("n", "<A-_>", ":wincmd <<CR>", opts)
keymap("n", "<A-m>", ":wincmd o<CR>", opts)

-- Sentence navigation
keymap("n", "<A-n>", "(", opts)
keymap("n", "<A-m>", ")", opts)

-- Marks
keymap("n", "m", "`", opts)
keymap("v", "m", "`", opts)

keymap("n", "<C-m>", "m", opts)

keymap("n", "<Leader>m", ":Telescope marks<CR>", opts)
keymap("n", "<Leader>t", ":TodoTelescope<CR>", opts)

local function delete_mark_on_current_line()
  local current_line = vim.fn.line(".")
  local marks = "abcdefghijklmnopqrstuvwxyz123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789" -- Local marks to check
  local change = false

  for mark in marks:gmatch(".") do
    local pos = vim.fn.getpos("'" .. mark) -- Get the position of the mark
    if pos[2] == current_line then -- Check if the mark is on the current line
      vim.cmd("delmarks " .. mark)
      change = true
    end
  end
  if change then
    vim.cmd("redraw!")
  else
    vim.notify("No marks found on current line")
  end
end

keymap("n", "dm", delete_mark_on_current_line, opts)

-- Parentheses
keymap("v", "<leader>(", "<Esc>`<i(<Esc>`>la)<Esc>", opts)
keymap("v", "<leader>[", "<Esc>`<i[<Esc>`>la]<Esc>", opts)
keymap("v", "<leader>{", "<Esc>`<i{<Esc>`>la}<Esc>", opts)
keymap("v", '<leader>"', '<Esc>`<i"<Esc>`>la"<Esc>', opts)
keymap("v", "<leader>'", "<Esc>`<i'<Esc>`>la'<Esc>", opts)

-- Checkboxes
keymap("n", "<C-c>", ":lua require('toggle-checkbox').toggle()<CR>", opts)
