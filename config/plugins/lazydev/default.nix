{
  plugins = {
    lazydev = {
      enable = false;
      settings = {
        enabled = true;
        library = [
          {
            path = "\${3rd}luv/library";
            words = [ "vim%.uv" ];
          }
        ];
      };
    };
  };
}
