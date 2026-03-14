local keymap = vim.keymap.set

local opts = {}
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

--Keep cursor in the center of the screen when moving up and down
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

--Allows search terms to stay in the middle
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Better paste
keymap("v", "p", "P", opts)

--make file executable
keymap("n", "<leader>x", function()
  local file = vim.fn.expand("%:p")
  vim.fn.system({ "chmod", "+x", file })
  vim.notify("Made executable: " .. file)
end, { silent = true, desc = "Make file executable" })

-- open buffer
keymap("n", "<leader>ls", ":ls<CR>")

-- Netrw
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Insert --
-- Press jk fast to exit
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--move highlighted contents
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--yank into system clipboard
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+Y')


-- Select entire line, except for newline
keymap("n", "vv", "0v$", { noremap = true })

-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Fuzzy finder (fzf-lua)
keymap("n", "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>")
keymap("n", "<leader>pr", "<cmd>lua require('fzf-lua').oldfiles()<CR>")
keymap("n", "<leader>pt", "<cmd>lua require('fzf-lua').live_grep()<CR>")
keymap("n", "<leader>pb", "<cmd>lua require('fzf-lua').buffers()<CR>")
keymap("n", "<leader>pm", "<cmd>lua require('fzf-lua').marks()<CR>")

-- Formatting
keymap("n", "<leader>fmt", vim.lsp.buf.format, {})

-- Comment toggle
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {})
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {})

-- LSP keymaps (only active in buffers with LSP attached)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf })
    end
    map("n", "K", function() vim.lsp.buf.hover({ max_width = 80 }) end)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "ge", vim.diagnostic.open_float)
    map("n", "gs", vim.diagnostic.show)
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

    -- Navigation
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gt", vim.lsp.buf.type_definition)
    map("n", "<leader>ds", vim.lsp.buf.document_symbol)
    map("n", "<leader>ws", vim.lsp.buf.workspace_symbol)

    -- Refactoring
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("i", "<C-s>", vim.lsp.buf.signature_help)

    -- Diagnostics
    map("n", "]d", vim.diagnostic.goto_next)
    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "<leader>dl", vim.diagnostic.setloclist)

    -- Call hierarchy
    map("n", "<leader>ci", vim.lsp.buf.incoming_calls)
    map("n", "<leader>co", vim.lsp.buf.outgoing_calls)
  end,
})

-- Jump back to last line when file was closed
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Shortcut Oyest to jump back/create yesterdays obsidian template
vim.api.nvim_create_user_command("Oyest", function()
  vim.cmd("ObsidianYesterday")
end, {})

vim.api.nvim_create_user_command('SCPDev', function(opts)
  local remote_path = opts.args
  local server = "rr280985@rrlnx-pwsd03"

  -- Ensure the path starts with a / for absolute paths on the server
  if not remote_path:match("^/") then
    remote_path = "/" .. remote_path
  end

  -- Construct the netrw scp string
  -- Note: Netrw uses // to indicate the start of an absolute path
  local target = string.format("scp://%s/%s", server, remote_path)

  print("Connecting to " .. server .. "...")
  vim.cmd("edit " .. target)
end, {
  nargs = 1,
  desc = "Edit a remote file via SCP/Netrw"
})


vim.api.nvim_create_user_command('SyncDev', function(opts)
    local remote_path = opts.args
    local server = "rr280985@rrlnx-pwsd03"
    
    -- Ensure we have an absolute path for the mapping
    if not remote_path:match("^/") then
        print("Error: Please provide an absolute remote path (starting with /)")
        return
    end

    -- The magic bit: Mirror the remote path locally
    -- If remote is /home/user/proj/main.py, local becomes /home/user/proj/main.py
    local local_file = remote_path
    local local_dir = vim.fn.fnamemodify(local_file, ":h")

    -- 1. Create the local directory structure
    if vim.fn.isdirectory(local_dir) == 0 then
        vim.fn.mkdir(local_dir, "p")
    end

    -- 2. Sync FROM remote to local
    -- Using --relative on rsync can be tricky, so we'll keep it simple:
    print("Pulling from " .. server .. "...")
    local pull_cmd = string.format(
        "rsync -avz --exclude='.git' --exclude='__pycache__' %s:%s %s",
        server, remote_path, local_file
    )
    vim.fn.system(pull_cmd)

    -- 3. Open the local file
    vim.cmd("edit " .. local_file)

    -- 4. Set up auto-sync back to server on save
    vim.api.nvim_create_autocmd("BufWritePost", {
        buffer = 0,
        callback = function()
            print("Pushing to " .. server .. "...")
            local push_cmd = string.format(
                "rsync -avz %s %s:%s",
                local_file, server, remote_path
            )
            vim.fn.system(push_cmd)
        end,
    })
end, { nargs = 1, desc = "Mirror and edit remote file via Rsync" })
