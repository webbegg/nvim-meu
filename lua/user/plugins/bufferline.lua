return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	enabled = false,
	config = function()
		local icons = require("user.icons")
		require("bufferline").setup({
			options = {
				diagnostics = false, -- "nvim_lsp", -- show lsp diagnostics
				mappings = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = false,
				separator_style = { "", "" },
				always_show_bufferline = true,
				modified_icon = icons.ui.Dot,
				diagnostics_indicator = true,
				enforce_regular_tabs = false,
				indicator = {
					style = "icon",
					icon = " ",
					buffer_close_icon = "",
					modified_icon = icons.ui.Dot,
					close_icon = icons.ui.BoldClose,
					left_trunc_marker = icons.ui.ArrowCircleLeft,
					right_trunc_marker = icons.ui.ArrowCircleRight,
				},
			},
		})
	end,
}
