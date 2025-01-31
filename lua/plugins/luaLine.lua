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
                lualine_a = { 'branch' },
                lualine_b = { 'diff' },
                lualine_c = { },
                lualine_x = { 'filename', 
                              function()
                                return vim.fn.expand('%:p:h')
                              end,
                              'data' },
                lualine_y = { },
                lualine_z = { function()
                                local time = os.date("*t")
                                local hour = time.hour % 12
                                local minute = time.min
                                local hours = { "Midnight", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Noon" }

                                local phrases = {
                                  [0] = string.format("%s o'clock", hours[hour+1]),
                                  [1] = string.format("Quarter past %s", hours[hour+ 1]),
                                  [2] = string.format("Half past %s", hours[hour + 1]),
                                  [3] = string.format("Quarter to %s", hours[hour + 2])
                                }
                                local minute_index = math.floor((minute + 7.5) % 60 / 15) -- Round to nearest quarter

                                return phrases[minute_index] -- quarter past, half past, quarter to
                              end,
                              'data' }

            },
            extensions = { 'quickfix', 'fugitive', 'nvim-tree' }
        }
    end
}
