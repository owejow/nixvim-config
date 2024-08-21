{ lib, ... }@inputs: {
  plugins = { markview = { enable = true; }; };
  extraConfigLua = lib.readFile ./extra-lua-config.lua;
}
