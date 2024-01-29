local M = {
  "webbegg/nvim-base16",
  priority = 1000,
}

function M.config()
  vim.cmd "colorscheme base16-meu"
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#393939" }) -- Change numbers color
  vim.cmd [[autocmd VimEnter * lua vim.cmd('set fillchars+=vert:\\ ')]] -- Hide vertical split rules
  vim.cmd [[autocmd VimEnter * lua vim.cmd('set fillchars+=horiz:\\ ')]] -- Hide vertical split rules
  -- vim.cmd [[hi StatusLine guibg=#ff0000 guifg=#ffffff]]
  -- vim.cmd [[hi StatusLineNC guibg=#00ff00 guifg=#ffffff]]
end

return M
