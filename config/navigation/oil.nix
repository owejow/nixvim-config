{
  plugins.oil = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = ''
        <cmd>Oil<cr>
      '';
      options = {
        desc = "Open parent directory";
      };
    }
  ];

}
