return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local icons = require 'user.icons'
    require('bufferline').setup {
      options = {
        diagnostics = false, -- 'nvim_lsp', -- show lsp diagnostics
        mappings = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = 'thin',
        always_show_bufferline = true,
        modified_icon = icons.ui.Dot,
        diagnostics_indicator = false,
      },
    }
  end,
}
