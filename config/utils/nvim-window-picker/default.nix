{ pkgs, lib, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-window-picker";
      src = pkgs.fetchFromGitHub {
        owner = "s1n7ax";
        repo = "nvim-window-picker";
        rev = "41cfaa428577c53552200a404ae9b3a0b5719706";
        hash = "sha256-D5ikm5Fw0N/AjDL71cuATp1OCONuxPZNfEHuh0vXkq0=";
      };
    })
  ];
  extraConfigLua = lib.readFile ./extra-lua-config.lua;

}
