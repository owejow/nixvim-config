{
  globals.mapleader = " ";
  keymaps = [
    {
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        desc = "Split Window Below";
        silent = true;
      };
    }
    {
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        desc = "Split Window Right";
        silent = true;
      };
    }
    {
      mode = "t";
      key = "<C-n>";
      action = "<c-\\><c-n>";
      options = {
        desc = "Enter Normal Mode";
        silent = true;
      };
    }
  ];
}
