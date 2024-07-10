{
  plugins.notify = { enable = true; };
  extraConfigLua =
    # lua
    ''
      vim.notify = require("notify")
    '';
}
