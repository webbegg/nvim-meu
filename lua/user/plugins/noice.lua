return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local icons = require("user.icons")
		require("noice").setup({
			cmdline = {
				view = "cmdline", -- cmdline, cmdline_popup
				position = "top",
				format = {
					-- title = "",
					cmdline = { pattern = "^:", icon = icons.ui.DoubleChevronRight, lang = "vim", title = "" },
					search_down = {
						kind = "search",
						pattern = "^/",
						icon = icons.ui.Search .. icons.ui.TriangleShortArrowDown,
						lang = "regex",
					},
					search_up = {
						kind = "search",
						pattern = "^%?",
						icon = icons.ui.Search .. icons.ui.TriangleShortArrowUp,
						lang = "regex",
					},
					help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				},
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = true, -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["vim.diagnostic"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				-- bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			-- routes = {
			-- 	{
			-- 		filter = {
			-- 			event = "msg_show",
			-- 			kind = "",
			-- 			find = "written",
			-- 		},
			-- 		opts = { skip = true },
			-- 	},
			-- 	{
			-- 		filter = {
			-- 			event = "msg_show",
			-- 			kind = "search_count",
			-- 		},
			-- 		opts = { skip = true },
			-- 	},
			-- },
		})
	end,
}
