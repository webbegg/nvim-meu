local M = {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "smoka7/hydra.nvim",
  },
  opts = {},
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "v", "n" },
      "<C-n>",
      "<cmd>MCstart<cr>",
      desc = "Create a selection for selected text or word under the cursor",
    },
  },
}

function M.config()
  require("multicursors").setup {}

  vim.api.nvim_set_hl(0, "MultiCursor", { fg = "#ffffff", bg = "#3A584D" })
  vim.api.nvim_set_hl(0, "MultiCursorMain", { fg = "#ffffff", bg = "#3A584D", bold = true })
end

-- local M = {
--   "mg979/vim-visual-multi",
-- }

return M
