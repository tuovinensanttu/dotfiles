vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- remap movement to work on colemak
keymap.set({ "n", "v", "o" }, "n", "h", { noremap = true }) -- n -> go left
keymap.set({ "n", "v", "o" }, "u", "k", { noremap = false }) -- u -> go up
keymap.set({ "n", "v", "o" }, "e", "j") -- e -> go down
keymap.set({ "n", "v", "o" }, "i", "l", { noremap = true }) -- i -> go right

-- remap e and w movements
keymap.set({ "n", "v", "o" }, "<S-n>", "b", { noremap = true }) -- N -> go to start of previous word
keymap.set({ "n", "v", "o" }, "<S-i>", "e", { noremap = true }) -- I -> go to end of next word

-- remap page down
keymap.set({ "n", "v" }, "<C-e>", "<C-d>zz", { noremap = true }) -- Control-e -> Page down
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { noremap = true }) -- Control-e -> Page down

-- remap moving between windows
keymap.set({ "n", "v" }, "<leader>n", "<C-w>h", { noremap = true }) -- Space-n -> switch windows to the left
keymap.set({ "n", "v" }, "<leader>i", "<C-w>l", { noremap = true }) -- Space-i -> switch windows to the right

keymap.set({ "n", "v" }, "l", "u", { noremap = true }) -- l -> undo
keymap.set({ "n", "v" }, "h", "i", { noremap = true }) -- h -> insert mode
keymap.set({ "n", "v" }, "<S-l>", "<C-r>", { noremap = true }) -- L -> asdasdasd

-- general keymaps
keymap.set({ "n", "v" }, "$", "^", { noremap = true })
keymap.set({ "n", "v" }, "^", "$", { noremap = true })

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabn<CR>") -- go previous tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>e", "<cmd>Telescope file_browser<cr>") -- open file browser

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
