{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = { indent = { enable = true; }; };
      folding = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<leader>gnn";
            node_incremental = "<leader>grn";
            scope_incremental = "<leader>grc";
            node_decremental = "<leader>grm";
          };
        };
      };
    };
  };
}
