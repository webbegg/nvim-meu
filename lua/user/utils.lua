local discipline = {}

function discipline.cowboy()
	---@type table?
	local id
	local ok = true
	for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
		local count = 0
		local timer = assert(vim.loop.new_timer())
		local map = key
		vim.keymap.set("n", key, function()
			if vim.v.count > 0 then
				count = 0
			end
			if count >= 10 then
				ok, id = pcall(vim.notify, "🤠 Hold it Cowboy!", vim.log.levels.WARN, {
					icon = "🤠",
					replace = id,
					keep = function()
						return count >= 10
					end,
				})
				if not ok then
					id = nil
					return map
				end
			else
				count = count + 1
				timer:start(2000, 0, function()
					count = 0
				end)
				return map
			end
		end, { expr = true, silent = true })
	end
end

return {
	getFileAndParentDir = function()
		local icons = require("user.icons")
		local file_full_path = vim.fn.expand("%:p")
		local file_name_with_ext = vim.fn.expand("%:t")
		local file_name_without_ext = file_full_path:match("^.+/(.+)%.%w+%.%w+$")
			or file_name_with_ext:match("^(.+)%.%w+$")
		local parent_dir = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:t")
		local grandparent_dir = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:h:t")
		local current_working_dir = vim.fn.getcwd()

		local fileIcon = icons.ui.FolderOpen

		if parent_dir == file_name_without_ext then
			return fileIcon .. grandparent_dir .. "/.../" .. file_name_with_ext
		elseif vim.fn.fnamemodify(file_full_path, ":h") == current_working_dir then
			return fileIcon .. file_name_with_ext
		else
			return fileIcon .. parent_dir .. "/" .. file_name_with_ext
		end
	end,
	discipline = discipline,
}
