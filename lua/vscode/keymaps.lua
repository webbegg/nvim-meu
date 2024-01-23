local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Easy scroll page
keymap("n", "<C-k>", "<C-u>zz", opts)
keymap("n", "<C-j>", "<C-d>zz", opts)
keymap("v", "<C-k>", "<C-u>zz", opts)
keymap("v", "<C-j>", "<C-d>zz", opts)
