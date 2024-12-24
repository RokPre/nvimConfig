return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended to use the latest release instead of the latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- Workspace Configuration
    workspaces = {
      {
        name = "vault",
        path = "~/sync/!Drive69/AObsidian/Notes", -- Ensure this matches your vault's root directory
      },
    },

    -- Log level for debugging
    log_level = vim.log.levels.INFO,

    -- Daily Notes Configuration
    daily_notes = {
      folder = "Dnevnik", -- Folder for daily notes
      date_format = "%Y-%j", -- Date format for daily note IDs
      default_tags = { "Dnevnik" }, -- Default tags for daily notes
      template = "dailyTemplate", -- Path to the daily template (rename if necessary)
    },

    -- Templates Configuration
    templates = {
      folder = "template", -- Ensure this matches the actual folder name in the vault
      date_format = "%Y-%m-%d", -- Date format for templates
      time_format = "%H:%M", -- Time format for templates
    },

    -- New Notes Location
    new_notes_location = "current_dir", -- Put new notes in the same directory as the current buffer

    -- Completion Configuration
    completion = {
      nvim_cmp = true, -- Enable nvim-cmp for completion
      min_chars = 2, -- Trigger completion after typing 2 characters
    },

    -- Custom Note ID Function (Optional)
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Custom Note Path Function (Optional)
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
    end,

    -- Key Mappings
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- Wiki Links Configuration
    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_id_prefix(opts)
    end,

    -- Markdown Links Configuration
    markdown_link_func = function(opts)
      return require("obsidian.util").markdown_link(opts)
    end,

    -- Link Style
    preferred_link_style = "wiki",

    -- Frontmatter Handling
    disable_frontmatter = false, -- Enable frontmatter management

    note_frontmatter_func = function(note)
      if note.title then
        note:add_alias(note.title)
      end
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    -- UI Features
    ui = {
      enable = false, -- Set to true to enable UI features (syntax highlights, checkboxes, etc.)
    },

    -- Sorting Options
    sort_by = "modified",
    sort_reversed = true,

    -- Image Handling
    attachments = {
      img_folder = "Attachment folder", -- Default folder for images
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
}
