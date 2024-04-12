local M = {
  'github/copilot.vim',
  event = 'VeryLazy',
  lazy = false,
}

function M.config()
  vim.cmd [[highlight Copilot guibg=#181818 guifg=#BCB35A]]
end

return M
