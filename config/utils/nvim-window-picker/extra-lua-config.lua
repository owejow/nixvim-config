local catppuccin_colors = require("colorscheme-helpers").catppuccin_colors

require("window-picker").setup({
  prompt_message = "Pick window: ",
  filter_rules = {
    -- when there is only one window available to pick from,
    -- use that window without prompting the user to select
    autoselect_one = true,

    -- whether you want to include the window you are currently
    -- on to window selection or not
    include_current_win = false,

    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { "NvimTree", "neo-tree", "notify" },

      -- if the file type is one of following, the window will be ignored
      buftype = { "terminal" },
    },

    -- filter using window options
    wo = {},

    -- if the file path contains one of following names, the window
    -- will be ignored
    file_path_contains = {},

    -- if the file name contains one of following names, the window will be
    -- ignored
    file_name_contains = {},
  },
  highlights = {
    statusline = {
      focused = {
        fg = catppuccin_colors().base,
        bg = catppuccin_colors().blue,
        bold = true,
      },
      unfocused = {
        fg = catppuccin_colors().base,
        bg = catppuccin_colors().blue,
        bold = true,
      },
    },
    winbar = {
      focused = {
        fg = catppuccin_colors().base,
        bg = catppuccin_colors().blue,
        bold = true,
      },
      unfocused = {
        fg = catppuccin_colors().base,
        bg = catppuccin_colors().blue,
        bold = true,
      },
    },
  },
})
