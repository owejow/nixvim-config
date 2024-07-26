{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = { indent = { enable = true; }; };
      folding = true;
      nixvimInjections = true;
      settings = { highlight.enable = true; };
    };
  };
}
