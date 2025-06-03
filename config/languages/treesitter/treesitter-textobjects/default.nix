{ lib, ... }: {
  plugins = { treesitter-textobjects = { enable = true; }; };
  extraConfigLua = lib.readFile ./extra-lua-config.lua;
}
