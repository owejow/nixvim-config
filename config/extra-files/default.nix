{ lib, ... }: {
  extraFiles = {
    "lua/colorscheme-helpers.lua".text = lib.readFile ./colorscheme-helpers.lua;
  };
}
