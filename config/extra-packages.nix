{ pkgs, ... }: {
  extraPackages = with pkgs; [
    ripgrep
    fd
    lldb
    haskellPackages.fast-tags
    haskellPackages.hoogle
    haskellPackages.hindent
    haskellPackages.ghci-dap
    haskellPackages.haskell-debug-adapter
    haskellPackages.haskell-language-server
    luajitPackages.haskell-tools-nvim
  ];
}
