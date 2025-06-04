{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        indent = {
          enable = true;
        };
      };
      folding = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<Enter>";
            node_incremental = "<Enter>";
            scope_incremental = false;
            node_decremental = "<Delete>";
          };
        };
      };
    };
  };
}
