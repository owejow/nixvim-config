{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;

  };
  autoCmd = [
    # Update git status when closing lazygit
    {
      event = [ "TermClose" ];

      callback = {
        __raw =
          # lua
          ''
            function()
              pattern = "*lazygit"
              if package.loaded["neo-tree.sources.git_status"] then
                require("neo-tree.sources.git_status").refresh()
              end
            end
          '';
      };
    }
  ];

  keymaps = [{
    mode = "n";
    key = "<leader>e";
    action = "<cmd>Neotree toggle<cr>";
    options = { desc = "Toggle Neotree"; };
  }];
}
