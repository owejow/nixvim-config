{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = { indent = { enable = true; }; };
      folding = true;
      nixvimInjections = true;
    };
  };
}
