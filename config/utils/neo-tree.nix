{
  plugins.neo-tree = { enable = true; };
  keymaps = [{
    mode = "n";
    key = "<leader>ft";
    action = "<cmd>Neotree toggle<cr>";
    options = { desc = "Toggle Neotree"; };
  }];
}
