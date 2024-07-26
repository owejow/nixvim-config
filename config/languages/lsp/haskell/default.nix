{ pkgs, lib, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ haskell-tools-nvim ];
  extraConfigLua = lib.readFile ./extra-lua-config.lua;
}
