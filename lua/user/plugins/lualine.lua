local M = {
	"nvim-lualine/lualine.nvim",
	enable = true,
}

M.config = function()
	-- local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
	vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = "#181818" }) -- sl_hl.background })
	local icons = require("user.icons")
	local diff = {
		"diff",
		colored = true,
		symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
	}

	-- local copilot = function()
	--   local buf_clients = vim.lsp.get_clients { bufnr = 0 }
	--   if #buf_clients == 0 then
	--     return 'LSP Inactive'
	--   end
	--
	--   local buf_client_names = {}
	--   local copilot_active = false
	--
	--   for _, client in pairs(buf_clients) do
	--     if client.name ~= 'null-ls' and client.name ~= 'copilot' then
	--       table.insert(buf_client_names, client.name)
	--     end
	--
	--     if client.name == 'copilot' then
	--       copilot_active = true
	--     end
	--   end
	--
	--   if copilot_active then
	--     return '%#Copilot#' .. icons.git.Octoface .. '%*'
	--   end
	--   return ''
	-- end
	--
	-- local currentSession = require('auto-session.lib').current_session_name
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
		grey_soft = "#6a6a6a",
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
			a = { fg = colors.grey_soft, bg = colors.black },
			b = { fg = colors.grey_soft, bg = colors.black },
			c = { fg = colors.grey_soft, bg = colors.black },
			x = { fg = colors.grey_soft, bg = colors.black },
			y = { fg = colors.grey_soft, bg = colors.black },
			z = { fg = colors.grey_soft, bg = colors.black },
		},
	}

	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree", "neo-tree" },
			theme = base16_meu,
			icons_enabled = true,
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		winbar = {
			lualine_c = {
				{
					"filename",
					path = 1,
					file_status = true,
					icons_enabled = true,
					icon = icons.ui.File,
				},
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					symbols = {
						error = icons.diagnostics.Error .. " ",
						warn = icons.diagnostics.Warning .. " ",
						info = icons.diagnostics.Information .. " ",
						hint = icons.diagnostics.Hint .. " ",
					},
				},
			},
			lualine_x = {
				diff,
				{ "branch", icon = "" },
				{
					function()
						return icons.ui.List .. "%l"
					end,
				},
			},
		},
		inactive_winbar = {
			lualine_a = {
				{
					"filename",
					path = 1,
					file_status = true,
					icons_enabled = true,
					icon = icons.ui.File,
				},
			},
			lualine_z = {},
		},
		tabline = {},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
