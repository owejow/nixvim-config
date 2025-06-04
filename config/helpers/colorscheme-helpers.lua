local M = {}

function M.catppuccin_colors()
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

return M
