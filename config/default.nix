{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldlAttrs;
  inherit (lib.lists) optional;
  by-name = ./plugins;
in
{
  # Plugin by-name directory imports
  imports =
    (foldlAttrs (
      prev: name: type:
      prev ++ optional (type == "directory") (by-name + "/${name}")
    ) [ ] (readDir by-name))
    ++ [
      # keep-sorted start
      ./helpers
      ./lsp
      ./keymaps.nix
      ./options.nix
      ./packages.nix
      # keep-sorted end
    ];

}
