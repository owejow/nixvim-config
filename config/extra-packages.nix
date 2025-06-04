{ nixpkgs-stable, ... }:
{
  extraPackages = [
    nixpkgs-stable.biome
    nixpkgs-stable.chafa
    nixpkgs-stable.clang-tools
    nixpkgs-stable.cmake-format
    nixpkgs-stable.fd
    nixpkgs-stable.gotools
    nixpkgs-stable.gofumpt
    nixpkgs-stable.golines
    nixpkgs-stable.isort
    nixpkgs-stable.jq
    nixpkgs-stable.lldb
    nixpkgs-stable.nixfmt-rfc-style
    nixpkgs-stable.ripgrep
    nixpkgs-stable.ruff
    nixpkgs-stable.rustfmt
    nixpkgs-stable.shellcheck
    nixpkgs-stable.shellharden
    nixpkgs-stable.stylua
    nixpkgs-stable.ueberzugpp
    nixpkgs-stable.viu
    nixpkgs-stable.wordnet
    nixpkgs-stable.yamlfmt
  ];
}
