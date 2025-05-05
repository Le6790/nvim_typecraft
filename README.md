# NEOVIM - Typecraft
<!-- ``` -->
<!---->
<!--                                   __ -->
<!--      ___     ___    ___   __  __ /\_\    ___ ___ -->
<!--     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\ -->
<!--    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ -->
<!--    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\ -->
<!--     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/ -->
<!-- ``` -->
![example_image](./example_screenshot_nvim.png)

[Built from Typecraft 0 to IDE](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&ab_channel=typecraft)

Using [Neovim0.9.4](https://github.com/neovim/neovim/releases/tag/v0.9.4)

[lazy.nvim package manager](https://github.com/folke/lazy.nvim)

### Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim)
  - Amazing plugin manager for Neovim
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
  - Welcome screen greeter
- [bufferline](https://github.com/akinsho/bufferline.nvim)
  - Snazzy tabs to show buffers
- [catppuccin](https://github.com/catppuccin/catppuccin)
  - Cozy pastel theme
- [comment.nvim](https://github.com/numToStr/Comment.nvim)
    - Comment lines
- completions
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - A completion engine plugin
  - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
    - nvim lsp completion source. Merges different completion results with nvm cmp
  - [luasnip](https://github.com/L3MON4D3/LuaSnip)
    - Snippet completion source
    - vs-code like snippets
- [fzf.nvim](https://github.com/junegunn/fzf.vim)
  - Fuzzy finder wrapper for nvim
- lsp-config
  - [mason.nvim](https://github.com/williamboman/mason.nvim)
    - Package manager
    - Easily install LSPs, linters, and formatters
  - [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
    - Closes some gaps between mason.nvim and lspconfig
    - Ensure_installed language servers
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - Configurations for LSP clients
    - Set keymaps shortcuts for diagnostics, buffer hints
  - keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "ge", vim.diagnostic.open_float)
      vim.keymap.set("n", "gs", vim.diagnostic.show)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
  - status line
- [none-ls](https://github.com/nvimtools/none-ls.nvim)
  - Inject diaognstics and formatters into LSP
- [nvimtree](https://github.com/nvim-tree/nvim-tree.lua)
  - A sidebar file explorer
- [osbidian](https://github.com/epwalsh/obsidian.nvim)
  - Obsidian plugin to write and navigate vaults
- [render markdown ](https://github.com/MeanderingProgrammer/render-markdown.nvim)
    - Improve viewing Markdown files
- [scrollview](https://github.com/dstein64/nvim-scrollview)
    - interative vertical scrollbar and signs
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
  - Highly extendable fuzzy finder
  - Not really used at the moment
- [tint](https://github.com/levouh/tint.nvim)
  - Dim inactive windows 
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - Parse generator tool to build syntax trees
- [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)
  - Line bookmark to save and jump back to 
- [vim-signify](https://github.com/mhinz/vim-signify)
  - Use the sign column to indicate VCS changes
- [which-key](https://github.com/folke/which-key.nvim)
  - Displays a popup with possible key bindings of the command you started typing
- [snacks](https://github.com/folke/snacks.nvim)
  - Folkes collection of QOL plugins. 
  - Notable features
    - picker
    - dashboard
    - lazygit integration
      { "<leader>.",  function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end,   desc = "Notification History" },
      { "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse",                  mode = { "n", "v" } },
      { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
      { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
      { "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
      { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
- [copilot-chat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)
  - ChatGPT like chat interface for Copilot
      { "<leader>zc", ":CopilotChat<CR>",         mode = "n", desc = "Chat with CoPilot" },
      { "<leader>ze", ":CopilotChatExplain<CR>",  mode = "v", desc = "Explain Code" },
      { "<leader>zr", ":CopilotChatReview<CR>",   mode = "v", desc = "Review Code" },
      { "<leader>zf", ":CopilotChatFix<CR>",      mode = "v", desc = "Fix Code Issues" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
      { "<leader>zd", ":CopilotChatDocs<CR>",     mode = "v", desc = "Generate Docs" },
      { "<leader>zt", ":CopilotChatTests<CR>",    mode = "v", desc = "Generate Tests" },
      { "<leader>zm", ":CopilotChatCommit<CR>",   mode = "n", desc = "Generate Commit Message" },
      { "<leader>zs", ":CopilotChatCommit<CR>",   mode = "v", desc = "Generate Commit for Selection" },



** pyright - installing npm
- https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
    - curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    - nvm ls -remote
    - nvm install v21.7.0



### Troubleshooting
- [:LspInfo - Cannot find module error using Node.js](https://stackoverflow.com/questions/78095216/pyright-lsp-install-in-neovim-nodeutil-module-not-found)
    - node.js on apt was out of date. install latest version to fix
    








