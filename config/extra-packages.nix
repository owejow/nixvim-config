{ pkgs, nixpkgs-stable, ... }: {
  extraPackages = [
    nixpkgs-stable.ripgrep
    nixpkgs-stable.fd
    pkgs.lldb
    pkgs.haskellPackages.fast-tags
    pkgs.haskellPackages.hoogle
    pkgs.haskellPackages.hindent
    pkgs.haskellPackages.ghci-dap
    pkgs.haskellPackages.haskell-debug-adapter
    pkgs.haskellPackages.haskell-language-server
    pkgs.luajitPackages.haskell-tools-nvim
  ];
}
