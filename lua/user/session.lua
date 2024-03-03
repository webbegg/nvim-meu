local M = {
  "rmagatti/auto-session",
}

M.config = function()
  require("auto-session").setup {
    log_level = vim.log.levels.ERROR,
    auto_save_enabled = true,
  }
  require("telescope").load_extension "session-lens"
  -- vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
  --   noremap = true,
  -- })
end

-- local M = {
--   "olimorris/persisted.nvim",
--   config = true,
-- }
--
-- M.config = function()
--   require("persisted").setup {
--     save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
--     silent = false, -- silent nvim message when sourcing session file
--     use_git_branch = false, -- create session files based on the branch of a git enabled repository
--     default_branch = "main", -- the branch to load if a session file is not found for the current branch
--     autosave = true, -- automatically save session files when exiting Neovim
--     should_autosave = nil, -- function to determine if a session should be autosaved
--     autoload = true, -- automatically load the session for the cwd on Neovim startup
--     on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
--     follow_cwd = true, -- change session file name to match current working directory if it changes
--     allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
--     ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
--     telescope = {
--       reset_prompt = true, -- Reset the Telescope prompt after an action?
--     },
--   }
--   require("telescope").load_extension "persisted"
-- end

return M
