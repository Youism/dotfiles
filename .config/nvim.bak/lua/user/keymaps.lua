-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
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

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tt", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
keymap("v", "<leader>ff", ":fold<CR>, opts")
keymap("n", "<leader>fc", ":foldopen<CR>, opts")

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Set the mapleader option to a single space character
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<F8>", ":TagbarToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", ";", ":", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>nn", ":noh<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>bb", ":bn<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>bk", ":Bdelete<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ss", ":w<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>rc",
	":e $HOME/.config/nvim/lua/user/keymaps.lua<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>pl",
	":e $HOME/.config/nvim/lua/user/plugins.lua.lua<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<Leader>zs", ":e $HOME/.zshrc<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fi", ":e $HOME/.config/fish/config.fish<CR>", { silent = true, noremap = true })
-- Map the mapleader key followed by aa to the ggVG command, which selects all text in the current buffer
vim.api.nvim_set_keymap("n", "<Leader>aa", "ggVG", { silent = true, noremap = true })
-- Map the mapleader key followed by gl to the $ command, which moves the cursor to the end of the line
keymap("n", "gl", "$", { silent = true, noremap = true })
keymap("n", "gh", "0", { silent = true, noremap = true })
keymap("n", "ge", "G", { silent = true, noremap = true })
keymap("n", "W", "5w", { silent = true, noremap = true })
keymap("n", "B", "5b", { silent = true, noremap = true })
keymap("n", "J", "5j", { silent = true, noremap = true })
keymap("n", "K", "5k", { silent = true, noremap = true })
keymap("n", "L", "A", { silent = true, noremap = true })
keymap("n", "H", "5h", { silent = true, noremap = true })
keymap("n", "<Leader>ww", "<C-w>w", { silent = true, noremap = true })
keymap("n", "<Leader>kk", "<C-w>k", { silent = true, noremap = true })
keymap("n", "<Leader>ll", "<C-w>l", { silent = true, noremap = true })
keymap("n", "<Leader>hh", "<C-w>h", { silent = true, noremap = true })
keymap("n", "<Leader>jj", "<C-w>j", { silent = true, noremap = true })
keymap("n", "<Leader>vv", ":vs<CR>", { silent = true, noremap = true })
keymap("i", "jk", "<Esc>", { silent = true, noremap = true })
keymap("i", "JK", "<Esc>", { silent = true, noremap = true })
keymap("v", "gl", "$", { silent = true, noremap = true })
keymap("v", "gh", "0", { silent = true, noremap = true })
keymap("v", "ge", "G", { silent = true, noremap = true })
keymap("v", "B", "5b", { silent = true, noremap = true })
keymap("v", "J", "5j", { silent = true, noremap = true })
keymap("v", "K", "5k", { silent = true, noremap = true })
keymap("v", "L", "5l", { silent = true, noremap = true })
keymap("v", "H", "5h", { silent = true, noremap = true })
-- place this in one of your configuration file(s)
keymap("n", "<Leader>hw", ":HopWord<CR>", { silent = true, noremap = true })
keymap("n", "<Leader>hl", ":HopLineStart<CR>", { silent = true, noremap = true })

