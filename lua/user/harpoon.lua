local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.config = function()
  local harpoon = require "harpoon"

  -- REQUIRED
  harpoon.setup {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  }
  -- REQUIRED

  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
  end)

  vim.keymap.set("n", "<leader><space>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  vim.keymap.set("n", "<leader>1", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "<leader>2", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "<leader>3", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "<leader>4", function()
    harpoon:list():select(4)
  end)
  vim.keymap.set("n", "<leader>5", function()
    harpoon:list():select(5)
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  -- vim.keymap.set("n", "<C-S-P>", function()
  --   harpoon:list():prev()
  -- end)
  -- vim.keymap.set("n", "<C-S-N>", function()
  --   harpoon:list():next()
  -- end)
end

return M
