return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian_brain",
      },
    },
    daily_notes = {
      date_format = "%Y/%m-%b/Daily Notes/%Y-%m-%d",
      template = "Daily Notes Template.md",
    },
    templates = {
      subdir = "templates",
    },
    ui = { enable = false },
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,

    -- see below for full list of options 👇
    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",


    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local creation_date = os.date("%Y-%m-%dT%H:%M%S") -- ISO 8601 format
      local out = { id = note.id, aliases = note.aliases, tags = note.tags, date = creation_date }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
  },
}
