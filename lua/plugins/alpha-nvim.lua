return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  commit = "41283fb402713fc8b327e60907f74e46166f4cfd",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Files <CR>"),
      dashboard.button("r", "󰄉 " .. " Recent files", ":History <CR>"),
      dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("p", " " .. " List Git Files", ":GFiles <CR>"),
      dashboard.button("t", " " .. " Find text", ":Rg <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("o", "OB" .. " Daily Note", ":cd ~/Documents/obsidian_brain <CR> :ObsidianToday <CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    local function footer()
      return "WeE wOo"
    end
    dashboard.section.footer.val = footer()
    dashboard.section.buttons.opts.hl = "Keyword"

    alpha.setup(dashboard.opts)
  end,
  enabled = false,
}
