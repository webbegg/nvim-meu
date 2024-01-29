local M = {
  "b0o/incline.nvim",
  enabled = true,
  event = "BufReadPre",
}

M.config = function()
  require("incline").setup {
    highlight = {
      groups = {
        InclineNormal = { guibg = "#181818", guifg = "#f2f2f2" },
        InclineNormalNC = { guibg = "#181818", guifg = "#343434" },
      },
    },
    window = { margin = { vertical = 0, horizontal = 1 } },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      local icon, color = require("nvim-web-devicons").get_icon_color(filename)
      return { { icon, guifg = color }, { " " }, { filename } }
    end,
  }
end

return M
