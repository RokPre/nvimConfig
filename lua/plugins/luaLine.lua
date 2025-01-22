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
                lualine_z = { 'location' }
            },
            extensions = { 'quickfix', 'fugitive', 'nvim-tree' }
        }
    end
}
