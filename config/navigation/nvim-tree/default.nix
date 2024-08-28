{ lib, ... }: {
  plugins.nvim-tree = { enable = true; };

  extraConfigLua = lib.readFile ./extra-lua-config.lua;
  keymaps = [{
    mode = "n";
    key = "<leader>e";
    action = "<cmd>NvimTreeToggle<cr>";
    options = { desc = "Toggle Neotree"; };
  }];
}
