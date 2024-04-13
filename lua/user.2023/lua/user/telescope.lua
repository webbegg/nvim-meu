local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- Unix --> build = "make",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      lazy = true,
    },
  },
  commit = "74ce793a60759e3db0d265174f137fb627430355",
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Search .. " ",
      selection_caret = " " .. icons.ui.BoldArrowRight .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {  },
      grep_string = {  },
      find_files = { previewer = false },
      buffers = {
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = { ["<C-d>"] = actions.delete_buffer },
          n = { ["dd"] = actions.delete_buffer },
        },
      },

      planets = { show_pluto = true, show_moon = true },

      colorscheme = { enable_preview = true },

      lsp_references = { initial_mode = "normal" },

      lsp_definitions = { initial_mode = "normal" },

      lsp_declarations = { initial_mode = "normal" },

      lsp_implementations = { initial_mode = "normal" },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
