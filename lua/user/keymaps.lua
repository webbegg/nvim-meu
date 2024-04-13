local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<esc>', ':nohlsearch<CR>')
keymap('n', '<C-Space>', '<cmd>WhichKey \\<space><cr>', opts)

-- Better save file
function SaveAndDoMore()
  vim.api.nvim_command 'stopinsert' -- exit insert mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false) -- exit visual mode
  vim.cmd 'VMClear' -- exit multicursors

  -- if vim.fn.exists ':EslintFixAll' == 2 then
  --   vim.cmd 'EslintFixAll'
  -- elseif vim.fn.exists ':Prettier' == 2 then
  --   vim.cmd 'Prettier'
  -- end

  vim.cmd 'wa' -- save all files
end

keymap({ 'n', 'v', 'i' }, '<C-s>', '<cmd>lua SaveAndDoMore()<cr>', opts)
keymap('i', 'jj', '<cmd>lua SaveAndDoMore()<cr>', opts)
keymap('i', 'kk', '<cmd>lua SaveAndDoMore()<cr>', opts)
keymap('i', 'jk', '<cmd>lua SaveAndDoMore()<cr>', opts)
keymap('i', 'kj', '<cmd>lua SaveAndDoMore()<cr>', opts)

-- Weird cmds
vim.api.nvim_create_user_command('W', SaveAndDoMore, {})
vim.api.nvim_create_user_command('Wa', SaveAndDoMore, {})
vim.api.nvim_create_user_command('Wqa', function()
  SaveAndDoMore()
  vim.cmd 'qa'
end, {})

-- Close current buffer
keymap('n', '<leader>bd', ':bd<CR>', opts)
keymap('n', '<leader>q', ':bd<CR>', opts)

-- Keybinds to make split navigation easier.
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
keymap('n', '<leader>xx', function()
  require('trouble').toggle()
end)
keymap('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end)
keymap('n', '<leader>j', function()
  require('trouble').next { skip_groups = true, jump = true }
end)
keymap('n', '<leader>k', function()
  require('trouble').previous { skip_groups = true, jump = true }
end)

-- jump to the previous item, skipping the groups
keymap('n', '<leader>k', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', '<leader>j', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- Resize window using <ctrl> arrow keys
keymap('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
keymap('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Maintain the cursor position when yanking a visual selection.
keymap('v', 'y', 'myy`y')
keymap('v', 'Y', 'myY`y')

-- Easy insertion of a trailing ; or , from insert mode.
keymap('i', ';;', '<Esc>A;<Esc>')
keymap('i', ',,', '<Esc>A,<Esc>')

-- Easy scroll page
keymap('n', '<C-k>', '<C-u>zz')
keymap('n', '<C-j>', '<C-d>zz')
keymap('v', '<C-k>', '<C-u>zz')
keymap('v', '<C-j>', '<C-d>zz')

-- Better window navigation
keymap('n', '<m-h>', '<C-w>h', opts)
keymap('n', '<m-j>', '<C-w>j', opts)
keymap('n', '<m-k>', '<C-w>k', opts)
keymap('n', '<m-l>', '<C-w>l', opts)
keymap('n', '<m-tab>', '<c-6>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('x', 'p', [["_dP]])

-- Disable avpag and repag
keymap({ 'n', 'i' }, '<PageUp>', '<Nop>', { noremap = true, silent = true })
keymap({ 'n', 'i' }, '<PageDown>', '<Nop>', { noremap = true, silent = true })

-- Disabel cursors
keymap({ 'n', 'v' }, '<Up>', '<Nop>', { noremap = true, silent = true })
keymap({ 'n', 'v' }, '<Down>', '<Nop>', { noremap = true, silent = true })
keymap({ 'n', 'v' }, '<Left>', '<Nop>', { noremap = true, silent = true })
keymap({ 'n', 'v' }, '<Right>', '<Nop>', { noremap = true, silent = true })
keymap({ 'n', 'v' }, '<Del>', '<Nop>', { noremap = true, silent = true })

-- Deshabilitar el clic derecho
keymap({ 'n', 'i' }, '<RightMouse>', '<Nop>', { noremap = true })

-- Disable record to prevent weird commands
keymap('n', 'e', '<Nop>', { noremap = true })

-- Neotree
keymap('n', '<leader>e', '<cmd>Neotree reveal float<cr>', opts)

-- Lspsaga terminal
keymap('n', '<A-Esc>', '<cmd>Lspsaga term_toggle<cr>', opts)
