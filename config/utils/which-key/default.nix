{ pkgs, lib, ... }: {
  plugins.which-key = { enable = true; };
  extraConfigLua = lib.readFile ./extra-lua-config.lua;
}
