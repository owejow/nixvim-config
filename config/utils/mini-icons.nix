{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "mini-icons";
      src = pkgs.fetchFromGitHub {
        owner = "echasnovski";
        repo = "mini.icons";
        rev = "c291191e2a2a99f8aeea5e4d6406af54d11c9608";
        hash = "sha256-ki+1xp3GZcsA08PFT4lbywdZgcbudJv9t8mrRsCLrcM=";
      };
    })
  ];

}
