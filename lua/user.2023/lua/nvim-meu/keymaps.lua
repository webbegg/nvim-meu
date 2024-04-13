local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<esc>", ":nohlsearch<CR>")
keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)

-- Better save file
function SaveAndDoMore()
  vim.api.nvim_command "stopinsert" -- exit insert mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false) -- exit visual mode
  vim.cmd "VMClear" -- exit multicursors

  -- if vim.fn.exists ":Prettier" == 2 then
  --   vim.cmd "Prettier"
  -- end

  if vim.fn.exists ":EslintFixAll" == 2 then
    vim.cmd "EslintFixAll"
  end

  vim.cmd "wa" -- save all files
end

keymap({ "n", "v", "i" }, "<C-s>", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap("i", "jj", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap("i", "kk", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap("i", "jk", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap("i", "kj", "<cmd>lua SaveAndDoMore()<cr>", opts)

-- Close current buffer
keymap("n", "<leader>bd", ":bd<CR>", opts)
keymap("n", "<leader>q", ":bd<CR>", opts)

-- Navigate between buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Maintain the cursor position when yanking a visual selection.
keymap("v", "y", "myy`y")
keymap("v", "Y", "myY`y")

-- Easy insertion of a trailing ; or , from insert mode.
keymap("i", ";;", "<Esc>A;<Esc>")
keymap("i", ",,", "<Esc>A,<Esc>")

-- Easy scroll page
keymap("n", "<C-k>", "<C-u>zz")
keymap("n", "<C-j>", "<C-d>zz")
keymap("v", "<C-k>", "<C-u>zz")
keymap("v", "<C-j>", "<C-d>zz")

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)
--
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- Disable avpag and repag
vim.api.nvim_set_keymap("n", "<PageUp>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<PageDown>", "<Nop>", { noremap = true, silent = true })

-- Disabel cursors
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Del>", "<Nop>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Right>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Del>", "<Nop>", { noremap = true, silent = true })

-- Deshabilitar el clic derecho
vim.api.nvim_set_keymap("n", "<RightMouse>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("v", "<RightMouse>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<RightMouse>", "<Nop>", { noremap = true })

-- Disable record to prevent weird commands
vim.api.nvim_set_keymap("n", "e", "<Nop>", { noremap = true })

-- Find
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
-- Neotree
keymap("n", "<leader>e", "<cmd>Neotree reveal float<cr>", opts)
