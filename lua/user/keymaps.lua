local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<esc>", ":nohlsearch<CR>", opts)

-- Better save file
function SaveAndDoMore()
	vim.api.nvim_command("stopinsert") -- exit insert mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false) -- exit visual mode
	vim.cmd("VMClear") -- exit multicursors

	-- if vim.fn.exists(":EslintFixAll") == 2 then
	-- 	vim.cmd("EslintFixAll")
	-- elseif vim.fn.exists(":Prettier") == 2 then
	-- 	vim.cmd("Prettier")
	-- end

	vim.cmd("wa") -- save all files
end

-- Save and do more
keymap({ "n", "v", "i" }, "<C-s>", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap("i", "jj", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap({ "n", "v", "i" }, "<C-Esc>", "<cmd>lua SaveAndDoMore()<cr>", opts)
keymap({ "n", "v" }, "<leader>w", "<cmd>lua SaveAndDoMore()<cr>", opts)

-- Weird cmds
vim.api.nvim_create_user_command("W", SaveAndDoMore, {})
vim.api.nvim_create_user_command("Wa", SaveAndDoMore, {})
vim.api.nvim_create_user_command("Wqa", function()
	SaveAndDoMore()
	vim.cmd("qa")
end, {})

-- Close current buffer
keymap("n", "<leader>bd", ":bd<CR>", opts)
keymap("n", "<leader>q", ":bd<CR>", opts)

-- Keybinds to make split navigation easier.
keymap("n", "<C-h>", "<C-w><C-h>", opts)
keymap("n", "<C-l>", "<C-w><C-l>", opts)
keymap("n", "<C-j>", "<C-w><C-j>", opts)
keymap("n", "<C-k>", "<C-w><C-k>", opts)

-- Diagnostic keymaps
keymap("n", "<leader>xx", function()
	require("trouble").toggle()
end)
keymap("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
keymap("n", "<leader>j", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)
keymap("n", "<leader>k", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end)

-- jump to the previous item, skipping the groups
-- keymap("n", "<leader>k", vim.diagnostic.goto_prev, opts)
-- keymap("n", "<leader>j", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>k", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)

keymap("n", "<leader>j", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", opts)

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Maintain the cursor position when yanking a visual selection.
keymap("v", "y", "myy`y")
keymap("v", "Y", "myY`y")

-- Easy insertion of a trailing ; or , from insert mode.
keymap("i", ";;", "<Esc>A;<Esc>")
keymap("i", ",,", "<Esc>A,<Esc>")

-- Easy scroll page
keymap({ "n", "v" }, "<C-k>", "<C-u>zz")
keymap({ "n", "v" }, "<C-j>", "<C-d>zz")
keymap({ "n", "v" }, "<C-u>", "<C-u>zz")
keymap({ "n", "v" }, "<C-d>", "<C-d>zz")

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- Disable avpag and repag
keymap({ "n", "i" }, "<PageUp>", "<Nop>", { noremap = true, silent = true })
keymap({ "n", "i" }, "<PageDown>", "<Nop>", { noremap = true, silent = true })

-- Disabel cursors
keymap({ "n", "v" }, "<Up>", "<Nop>", { noremap = true, silent = true })
keymap({ "n", "v" }, "<Down>", "<Nop>", { noremap = true, silent = true })
keymap({ "n", "v" }, "<Left>", "<Nop>", { noremap = true, silent = true })
keymap({ "n", "v" }, "<Right>", "<Nop>", { noremap = true, silent = true })
keymap({ "n", "v" }, "<Del>", "<Nop>", { noremap = true, silent = true })

-- Deshabilitar el clic derecho
keymap({ "n", "i" }, "<RightMouse>", "<Nop>", { noremap = true })

-- Disable record to prevent weird commands
keymap("n", "q", "<Nop>", { noremap = true })

-- Neotree
keymap("n", "<leader>e", "<cmd>Neotree reveal float<cr>", opts)
keymap("n", "<leader><s-tab>", "<cmd>Neotree left toggle reveal<cr>", opts)
keymap("n", "<leader><tab>", "<cmd>Neotree right toggle reveal<cr>", opts)

-- Lspsaga terminal
keymap("n", "<A-Esc>", "<cmd>Lspsaga term_toggle<cr>", opts)

-- Harpoon
keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>hk", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<leader>hj", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<leader>h6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
keymap("n", "<leader>h7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
keymap("n", "<leader>h8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
keymap("n", "<leader>h9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)

-- Gitsigns actions
keymap("n", "<leader>ga", "<cmd>lua require('gitsigns').stage_hunk()<cr>", opts)
keymap("n", "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", opts)
keymap("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", opts)
keymap("n", "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", opts)
keymap("n", "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<cr>", opts)
keymap("n", "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<cr>", opts)
keymap("n", "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", opts)

-- TODOS List
keymap("n", "<A-t>", "<cmd>TodoTelescope<cr>", opts)

-- Rename
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- COPILOT
function toggleCopilot()
	require("copilot.suggestion").toggle_auto_trigger()
	print(" Copilot: " .. (vim.g.copilot_auto_trigger and "Enabled" or "Disabled" .. "  "))
end

keymap("i", "<M-l>", "<cmd>lua require('copilot.suggestion').accept()<cr>", opts)
keymap("i", "<M-j>", "<cmd>lua require('copilot.suggestion').next()<cr>", opts)
keymap("i", "<M-k>", "<cmd>lua require('copilot.suggestion').prev()<cr>", opts)
keymap("i", "<M-Esc>", "<cmd>lua require('copilot.suggestion').dismiss()<cr>", opts)
keymap("n", "<leader>cp", "<cmd>lua toggleCopilot()<cr>", {
	noremap = true,
	silent = false,
})

-- require("user.utils").discipline.cowboy()

-- Toggle linenumber and relative numbers in the same keymap
--
function ToggleNumbers()
	if vim.wo.number then
		vim.wo.relativenumber = false
		vim.wo.number = false
	else
		vim.wo.relativenumber = true
		vim.wo.number = true
	end
end

keymap("n", "<leader>ln", ":lua ToggleNumbers()<CR>", opts)
