{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ nvim-surround ];
  extraConfigLua =
    # lua
    ''
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    '';
}
