{
  plugins = {
    lazydev = {
      enable = true;

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
