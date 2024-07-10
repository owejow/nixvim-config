{
  globals.mapleader = " ";
  keymaps = [
    {
      key = "<leader>-";
      action = "<C-W>s";
      options.desc = "Split Window Below";
    }
    {
      key = "<leader>|";
      action = "<C-W>v";
      options.desc = "Split Window Right";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>qa<cr>";
      options.desc = "Quit";
    }
  ];
}
