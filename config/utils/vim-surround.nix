{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-surround";
      src = pkgs.fetchFromGitHub {
        owner = "tpope";
        repo = "vim-surround";
        rev = "3d188ed2113431cf8dac77be61b842acb64433d9";
        hash = "sha256-DZE5tkmnT+lAvx/RQHaDEgEJXRKsy56KJY919xiH1lE=";
      };
    })
  ];

}
