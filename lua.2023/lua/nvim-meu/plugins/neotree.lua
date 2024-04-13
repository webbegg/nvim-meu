local M = {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      visible = false,
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
      },
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
    window = {
      position = "float",
      mappings = {
        ["<space>"] = "none",
      },
    },
  },
}

M.deactivate = function()
  vim.cmd [[Neotree close]]
end

M.init = function()
  vim.g.neo_tree_remove_legacy_commands = 1
  if vim.fn.argc() == 1 then
    local stat = vim.loop.fs_stat(vim.fn.argv(0))
    if stat and stat.type == "directory" then
      require "neo-tree"
    end
  end
end

return M
