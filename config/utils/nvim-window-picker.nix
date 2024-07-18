{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-window-picker";
      src = pkgs.fetchFromGitHub {
        owner = "s1n7ax";
        repo = "nvim-window-picker";
        rev = "41cfaa428577c53552200a404ae9b3a0b5719706";
        hash = "sha256-D5ikm5Fw0N/AjDL71cuATp1OCONuxPZNfEHuh0vXkq0=";
      };
    })
  ];
  extraConfigLua =
    # lua
    ''
        local catppuccin_colors = function()
          local colorscheme = vim.g.colors_name
          local palette = ""
          if colorscheme == "catppuccin-latte" then
            palette = "latte"
          elseif colorscheme == "catppuccin-frappe" then
            palette = "frappe"
          elseif colorscheme == "catppuccin-macchiato" then
            palette = "macchiato"
          else
            palette = "mocha"
          end
          return require("catppuccin.palettes").get_palette(palette)
        end

        require'window-picker'.setup({
           prompt_message = 'Pick window: ',
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
                  filetype = { 'NvimTree', 'neo-tree', 'notify' },

                  -- if the file type is one of following, the window will be ignored
                  buftype = { 'terminal' },
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
    '';

}
