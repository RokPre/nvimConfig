-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Navigation
keymap("n", "gh", "^", opts)
keymap("n", "gl", "$", opts)

keymap("v", "gh", "^", opts)
keymap("v", "gl", "$", opts)

keymap("o", "gh", "^", opts)
keymap("o", "gl", "$", opts)

-- Upperacse
keymap("n", "<C-u>", "~h", opts)
keymap("v", "<C-u>", "~", opts)

local cmp = require("cmp")

cmp.setup({
  -- Define your completion sources, e.g., nvim_lsp, buffer, etc.
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },

  -- Default key mappings
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
})

keymap("i", "<A-l>", [[<C-g>u<Esc>[s1z=`]a<C-g>u]], opts)

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

-- Map for redo
keymap("n", "<S-u>", "<C-r>", opts)
keymap("v", "<S-u>", "<C-r>", opts)

keymap("n", "f", "*", opts)
keymap("v", "f", '"zy/<C-R>z<CR>', opts)

local function search()
  local word = vim.fn.input("Search: ")
  if word == nil or word == "" then
    print("No word found")
    return
  end

  vim.cmd(":/" .. word)
end

keymap("n", "<C-f>", search, opts)
keymap("i", "<C-f>", search, opts)
keymap("v", "<C-f>", search, opts)

local last_find = ""
local last_replace = ""
function Find_and_replace(all, currentWord)
  local word
  if currentWord then
    word = vim.fn.expand("<cword>")
  else
    word = vim.fn.input("Find: ")
  end

  if word == nil or word == "" then
    print("No word found")
    return
  end

  local replacement = vim.fn.input("Replace with: ")
  if replacement == nil or replacement == "" then
    print("Cancelled")
    return
  end

  -- something to do with specail characters
  word = vim.fn.escape(word, "/\\")
  replacement = vim.fn.escape(replacement, "/\\")

  if all then
    vim.cmd(":%s/" .. word .. "/" .. replacement .. "/g")
  else
    vim.cmd(":s/" .. word .. "/" .. replacement .. "/")
  end
  print("Replaced '" .. word .. "' with '" .. replacement .. "' " .. (all and "globally." or "in the current line."))
  last_find = word
  last_replace = replacement
end

function Repeat_last_replace(all)
  if last_find == "" or last_replace == "" then
    print("No previous replace action found.")
    return
  end

  if all then
    vim.cmd(":%s/" .. last_find .. "/" .. last_replace .. "/g")
  else
    vim.cmd(":s/" .. last_find .. "/" .. last_replace .. "/")
  end
  print(
    "Repeated replacing '"
      .. last_find
      .. "' with '"
      .. last_replace
      .. "' "
      .. (all and "globally." or "in the current line.")
  )
end
-- >Word under cursor
-- >>Current line
keymap("i", "<C-r>", ":lua Find_and_replace(false, true)<CR>", opts)
keymap("n", "<C-r>", ":lua Find_and_replace(false, true)<CR>", opts)
keymap("v", "<C-r>", ":lua Find_and_replace(false, true)<CR>", opts)

-- >>Entire file
keymap("n", "g<C-r>", ":lua Find_and_replace(true, true)<CR>", opts)
keymap("v", "g<C-r>", ":lua Find_and_replace(true, true)<CR>", opts)

-- >Search word
-- >>Current line
keymap("i", "<A-r>", ":lua Find_and_replace(false, false)<CR>", opts)
keymap("n", "<A-r>", ":lua Find_and_replace(false, false)<CR>", opts)
keymap("v", "<A-r>", ":lua Find_and_replace(false, false)<CR>", opts)
-- >>Entire file
keymap("n", "g<A-r>", ":lua Find_and_replace(true, false)<CR>", opts)
keymap("v", "g<A-r>", ":lua Find_and_replace(true, false)<CR>", opts)

-- Repeat last replace
keymap("n", "<leader>r", ":lua Repeat_last_replace(false)<CR>", opts)

-- Repeat last replace
keymap("n", "g<leader>r", ":lua Repeat_last_replace(true)<CR>", opts)

keymap("n", "<A-o>", "i[[", opts)
keymap("v", "<A-o>", ':"<C-R>=[[<C-R>".."]]"<CR>', opts) -- Surrounds selected text with [[ ]]

-- Obsidian keybindings
local function insert_current_time()
  local current_time = os.date("%H:%M")
  local formatted_time = "#### " .. current_time
  vim.api.nvim_put({ formatted_time }, "", true, true)
end

keymap("n", "<leader>oo", ":ObsidianOpen<CR>", opts)
keymap("n", "<C-d>", ":ObsidianToday<CR>", opts)

keymap("n", "<A-t>", insert_current_time, opts)
keymap("i", "<A-t>", insert_current_time, opts)

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
keymap("n", "<A-s>", "(", opts)
keymap("n", "<A-g>", ")", opts)

-- Scrolling
keymap("n", "<A-d>", ":lua require('neoscroll').scroll(1)<CR>", opts)
keymap("n", "<A-f>", ":lua require('neoscroll').scroll(-1)<CR>", opts)

-- Marks
keymap("n", "<C-m>", "`", opts)
keymap("i", "<C-m>", "`", opts)
keymap("v", "<C-m>", "`", opts)

-- Move lines down
keymap("n", "<C-j>", ":m .+1<CR>==", opts) -- move line up(n)
keymap("n", "<C-k>", ":m .-2<CR>==", opts) -- move line down(n)
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts) -- move line up(v)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts) -- move line down(v)

keymap("v", "<leader>(", "<Esc>`<i(<Esc>`>a)<Esc>", opts)
keymap("v", "<leader>[", "<Esc>`<i[<Esc>`>a]<Esc>", opts)
keymap("v", "<leader>{", "<Esc>`<i{<Esc>`>a}<Esc>", opts)
