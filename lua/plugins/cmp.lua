return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "SirVer/ultisnips", -- Add UltiSnips plugin
    {
      "quangnguyen30192/cmp-nvim-ultisnips", -- Add UltiSnips integration for nvim-cmp
      config = function()
        -- No `setup` function here; simply ensure the plugin is loaded
      end,
    },
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local snip = require("cmp_nvim_ultisnips.mappings")
    return {
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Tab>"] = cmp.mapping(function(fallback)
          snip.expand_or_jump_forward(fallback)
        end, { "i", "s" }),
        ["<C-S-Tab>"] = cmp.mapping(function(fallback)
          snip.jump_backward(fallback)
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "ultisnips" }, -- Add UltiSnips source
        { name = "lazydev" },
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      experimental = {
        -- only show ghost text when we show ai completions
        ghost_text = vim.g.ai_cmp and {
          hl_group = "CmpGhostText",
        } or false,
      },
    }
  end,
}

