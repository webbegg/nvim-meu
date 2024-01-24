return {
  getFileAndParentDir = function()
    local file_full_path = vim.fn.expand "%:p"
    local file_name_with_ext = vim.fn.expand "%:t"
    local file_name_without_ext = file_full_path:match "^.+/(.+)%.%w+%.%w+$" or file_name_with_ext:match "^(.+)%.%w+$"
    local parent_dir = vim.fn.fnamemodify(vim.fn.expand "%", ":h:t")
    local grandparent_dir = vim.fn.fnamemodify(vim.fn.expand "%", ":h:h:t")
    local current_working_dir = vim.fn.getcwd()

    if parent_dir == file_name_without_ext then
      return grandparent_dir .. "/../" .. file_name_with_ext
    elseif vim.fn.fnamemodify(file_full_path, ":h") == current_working_dir then
      return file_name_with_ext
    else
      return parent_dir .. "/" .. file_name_with_ext
    end
  end,
}
