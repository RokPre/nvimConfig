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

local function check_terminal_and_cancel()
  -- Check if we're in normal mode
  if vim.fn.mode() ~= "n" then
    return
  end

  -- Get the list of windows and check for a floating terminal
  local windows = vim.api.nvim_list_wins()
  local terminal_open = false
  local term_win_id = 0

  for _, win_id in ipairs(windows) do
    local buf_id = vim.api.nvim_win_get_buf(win_id)
    local buf_type = vim.api.nvim_buf_get_option(buf_id, "buftype")
    if buf_type == "terminal" then
      -- Check if the window is floating
      local win_info = vim.api.nvim_win_get_config(win_id)
      if win_info.relative ~= "" then
        terminal_open = true
        term_win_id = win_id
        break
      end
    end
  end

  if not terminal_open then
    vim.api.nvim_err_writeln("No terminal window is open")
    return
  end

  -- Switch to the terminal window and send the cancel command
  vim.api.nvim_set_current_win(term_win_id)
  vim.cmd("startinsert")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
  vim.defer_fn(function()
    vim.api.nvim_win_close(term_win_id, true)
  end, 100) -- 100 milliseconds delay
end

-- Bind the function to a key mapping (example: <leader>tc)
keymap("n", "<C-c>", check_terminal_and_cancel, opts)

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

local function correct_and_notify()
  -- Get the original misspelled word
  vim.cmd("normal! <C-g>u<Esc>")
  local original_word = vim.fn.expand("<cword>")
  vim.cmd("normal! [s1z=`]")
  local corrected_word = vim.fn.expand("<cword>")
  if original_word ~= corrected_word then
    vim.notify("Corrected: " .. original_word .. " -> " .. corrected_word)
  else
    vim.notify("No correction needed")
  end
  vim.cmd("startinsert")
end

-- Define the mapping for spelling corrections
keymap("i", "<C-a>", correct_and_notify, opts)

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

-- Map 'gd' to delete and copy to clipboard
keymap("n", "<C-d>", '"*d', opts) -- Normal mode
keymap("v", "<C-d>", '"*d', opts) -- Visual mode

-- Map for redo
keymap("n", "<S-u>", "<C-r>", opts)
keymap("v", "<S-u>", "<C-r>", opts)

keymap("n", "f", "*", opts)
keymap("v", "f", "*", opts)

local Last_search_word = nil
local Last_replacement_word = nil

local function find_and_replace()
  local mode = vim.fn.mode()
  local word
  if mode == "v" or mode == "V" then
    -- Get the highlighted text in visual mode
    vim.cmd('normal! "vy') -- Yank the highlighted text into the "v" register
    word = vim.fn.getreg("v") -- Retrieve the yanked text
  else
    -- Get the word under the cursor in normal mode
    word = vim.fn.expand("<cword>")
  end
  -- Prefill the command-line for interactive search and replace
  local replacement = vim.fn.input("Replace with: ")
  if replacement == "" then
    return
  elseif replacement == "!nothing" then
    replacement = ""
  end
  Last_search_word = word
  Last_replacement_word = replacement
  vim.cmd(":s/" .. word .. "/" .. replacement .. "/")
end

local function find_and_replace_entire_file()
  local mode = vim.fn.mode()
  local word
  if mode == "v" or mode == "V" then
    -- Get the highlighted text in visual mode
    vim.cmd('normal! "vy') -- Yank the highlighted text into the "v" register
    word = vim.fn.getreg("v") -- Retrieve the yanked text
  else
    -- Get the word under the cursor in normal mode
    word = vim.fn.expand("<cword>")
  end
  -- Prefill the command-line for interactive search and replace
  local replacement = vim.fn.input("Replace with: ")
  if replacement == "" then
    return
  elseif replacement == "!nothing" then
    replacement = ""
  end
  Last_search_word = word
  Last_replacement_word = replacement
  vim.cmd(":%s/" .. word .. "/" .. replacement .. "/")
end

local function repeat_last_replace()
  if Last_search_word ~= nil and Last_replacement_word ~= nil then
    -- Get the word under the cursor
    local current_word = vim.fn.expand("<cword>")

    -- Check if the word under the cursor matches the last search word
    if current_word ~= Last_search_word then
      vim.cmd("normal! n")
    end
    vim.cmd(":s/" .. Last_search_word .. "/" .. Last_replacement_word .. "/")
  else
    print("No previous find and replace command.")
  end
end

-- Map this function to a keybinding (e.g., Ctrl + r)
keymap("n", "<C-f>", find_and_replace, opts)
keymap("v", "<C-f>", find_and_replace, opts)

keymap("n", "g<C-f>", find_and_replace_entire_file, opts)
keymap("v", "g<C-f>", find_and_replace_entire_file, opts)

keymap("n", "<C-r>", repeat_last_replace, opts)

keymap("n", "<C-k>", "i[[", opts)
keymap("i", "<C-k>", "[[", opts)
keymap("v", "<C-k>", ':"<C-R>=[[<C-R>".."]]"<CR>', opts) -- Surrounds selected text with [[ ]]

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
