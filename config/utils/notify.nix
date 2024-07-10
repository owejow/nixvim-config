{
  # In theory this should be handled by noice but it doesn't work
  plugins.notify = { enable = true; };
  extraConfigLua =
    # lua
    ''
      vim.notify = require("notify")
    '';
}
