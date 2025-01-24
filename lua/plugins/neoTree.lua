return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["l"] = "open",
            ["h"] = "",
            ["v"] = "open_vsplit",
            ["b"] = "open_split",
          }
        },
      })
      vim.api.nvim_set_keymap("n", "<Leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
    end,
}

