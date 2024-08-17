{
  imports = [
    ./nvim-window-picker
    ./auto-pairs.nix
    ./blankline.nix
    ./dressing.nix
    ./mini-icons.nix
    ./nui.nix
    ./nvim-surround.nix
    ./nvim-ufo.nix
    # comment out because of issue of compatibility with treesitter causes hang in zig file saves
    #./rainbow-delimiters.nix
    ./toggleterm.nix
    ./which-key.nix
  ];
}
