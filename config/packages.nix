{ nixpkgs-stable, ... }:
let
  pkg = nixpkgs-stable;
in
{
  extraPackages = [
    pkg.biome
    pkg.chafa
    pkg.curl
    pkg.clang-tools
    pkg.cmake-format
    pkg.fd
    pkg.fzf
    pkg.gotools
    pkg.gofumpt
    pkg.golines
    pkg.isort
    pkg.jq
    pkg.lldb
    pkg.nixfmt-rfc-style
    pkg.ripgrep
    pkg.ruff
    pkg.rustfmt
    pkg.shellcheck
    pkg.shellharden
    pkg.stylua
    pkg.ueberzugpp
    pkg.viu
    pkg.wordnet
    pkg.yamlfmt
  ];
}
