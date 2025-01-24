return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                theme = 'auto'
            },
            tabline = { },
            sections = { 
                lualine_a = { 'tabs' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = {
  function()
    local time = os.date("*t") -- Get the current time
    local quarter_symbols = { "¼", "½", "¾", "" } -- Quarter symbols
    local quarter_index = math.floor((time.min + 7.5) / 15) -- Determine the quarter index
    if quarter_index == 4 then
      time.hour = (time.hour + 1) % 24 -- Handle hour overflow
      quarter_index = 0
    end
    return string.format("%02d:%s", time.hour, quarter_symbols[quarter_index + 1])
  end,
  'data',
  "require'lsp-status'.status()"
}

            },
            extensions = { 'quickfix', 'fugitive', 'nvim-tree' }
        }
    end
}
