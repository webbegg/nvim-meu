local M = {
  "lmburns/lf.nvim",
  cmd = "Lf",
  dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
  opts = {
    winblend = 0,
    highlights = { NormalFloat = { guibg = "NONE" } },
    border = "single",
    escape_quit = true,
  },
  keys = {
    { "<leader>e", "<cmd>Lf<cr>", desc = "NeoTree" },
  },
}

return M
