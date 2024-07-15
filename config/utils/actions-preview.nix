{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ actions-preview-nvim ];

  keymaps = [{
    key = "<leader>cp";
    action = { __raw = "require('actions-preview').code_actions"; };
    options.desc = "preview code actions";
  }];
}
