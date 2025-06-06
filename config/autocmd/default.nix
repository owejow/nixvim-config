{ lib, ... }:
{
  extraConfigLua = lib.readFile ./extra-lua-config.lua;
}
