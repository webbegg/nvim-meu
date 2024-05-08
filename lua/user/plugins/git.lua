return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			local icons = require("user.icons")
			local defaultIcon = "" -- "┆"

			require("gitsigns").setup({
				signs = {
					untracked = {
						hl = "GitSignsUntracked",
						text = defaultIcon,
						numhl = "GitSignsUntrackedNr",
						linehl = "GitSignsUntrackedLn",
					},
					add = {
						hl = "GitSignsAdd",
						text = defaultIcon,
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = defaultIcon,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = icons.ui.TriangleShortArrowRight,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = icons.ui.TriangleShortArrowRight,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = defaultIcon,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				status_formatter = nil,
				update_debounce = 200,
				max_file_length = 40000,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = { enable = false },

				on_attach = function(bufnr)
					vim.keymap.set(
						"n",
						"<leader>H",
						require("gitsigns").preview_hunk,
						{ buffer = bufnr, desc = "Preview git hunk" }
					)

					vim.keymap.set("n", "]]", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Next git hunk" })

					vim.keymap.set(
						"n",
						"[[",
						require("gitsigns").prev_hunk,
						{ buffer = bufnr, desc = "Previous git hunk" }
					)
				end,
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewFileHistory",
		},
		opts = {
			file_panel = {
				position = "bottom",
				height = 20,
			},
			-- hooks = {
			-- 	view_opened = function()
			-- 		local stdout = vim.loop.new_tty(1, false)
			-- 		if stdout ~= nil then
			-- 			stdout:write(
			-- 				("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format(
			-- 					"DIFF_VIEW",
			-- 					vim.fn.system({ "base64" }, "+4")
			-- 				)
			-- 			)
			-- 			vim.cmd([[redraw]])
			-- 		end
			-- 	end,
			-- 	view_closed = function()
			-- 		local stdout = vim.loop.new_tty(1, false)
			-- 		if stdout ~= nil then
			-- 			stdout:write(
			-- 				("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format(
			-- 					"DIFF_VIEW",
			-- 					vim.fn.system({ "base64" }, "-1")
			-- 				)
			-- 			)
			-- 			vim.cmd([[redraw]])
			-- 		end
			-- 	end,
			-- },
		},
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
			{ "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose" },
		},
	},
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- not git, but it's okay
	"mbbill/undotree",
}
