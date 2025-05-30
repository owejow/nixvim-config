{ pkgs, nixpkgs-stable, ... }: {
  extraPackages = [
    nixpkgs-stable.ripgrep
    nixpkgs-stable.fd
    nixpkgs-stable.wordnet
    nixpkgs-stable.lldb
    nixpkgs-stable.glab
  ];
}
