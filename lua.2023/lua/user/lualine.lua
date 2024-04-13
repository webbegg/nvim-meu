local M = {
  "nvim-lualine/lualine.nvim",
  commit = "7533b0ead663d80452210c0c089e5105089697e5",
}

function M.config()
  -- local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = "#2D2D2D" }) -- sl_hl.background })
  local icons = require "user.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  -- local copilot = function()
  --   local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
  --   if #buf_clients == 0 then
  --     return "LSP Inactive"
  --   end
  --
  --   local buf_client_names = {}
  --   local copilot_active = false
  --
  --   for _, client in pairs(buf_clients) do
  --     if client.name ~= "null-ls" and client.name ~= "copilot" then
  --       table.insert(buf_client_names, client.name)
  --     end
  --
  --     if client.name == "copilot" then
  --       copilot_active = true
  --     end
  --   end
  --
  --   if copilot_active then
  --     return "%#Copilot#" .. icons.git.Octoface .. "%*"
  --   end
  --   return ""
  -- end
  --
  -- local filenameAndParentDir = require("user.utils").getFileAndParentDir

  local colors = {
    blue = "#80a0ff",
    cyan = "#8ab3b5",
    black = "#191919",
    white = "#c6c6c6",
    red = "#ab6077",
    violet = "#d183e8",
    grey = "#282828",
    green = "#a1b56c",
  }

  local base16_meu = {
    normal = {
      a = { fg = colors.white, bg = colors.cyan },
      b = { fg = colors.white, bg = colors.grey },
      c = { fg = colors.white, bg = colors.black },
    },

    insert = { a = { fg = colors.white, bg = colors.green } },
    visual = { a = { fg = colors.white, bg = colors.cyan } },
    replace = { a = { fg = colors.white, bg = colors.red } },

    inactive = {
      a = { fg = colors.white, bg = colors.black },
      b = { fg = colors.white, bg = colors.black },
      c = { fg = colors.black, bg = colors.black },
    },
  }

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree", "neo-tree" },
      theme = base16_meu,
      icons_enabled = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function()
            return " "
          end,
        },
      },
      lualine_b = { { "branch", icon = "" }, diff },
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = { "diagnostics" },
      lualine_y = { "location" },
      lualine_z = {},
    },
    winbar = {
      lualine_a = {
        { get_name, cond = is_active },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = { require("auto-session.lib").current_session_name },
      lualine_z = {},
    },

    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
