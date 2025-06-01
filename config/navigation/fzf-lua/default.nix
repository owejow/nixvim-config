{ lib, ... }: {
  plugins.fzf-lua = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "files";
        options.desc = "[F]ind [F]iles";
      };

      "<leader>/" = {
        action = "live_grep";
        options.desc = "Ripgrep files";
      };

      "<leader>fh" = {
        action = "helptags";
        options = { desc = "[F]ind [H]elp"; };
      };

      "<leader>fk" = {
        action = "find_keymaps";
        options = { desc = "[F]ind [K]eymaps"; };
      };

      "<leader>fb" = {
        action = "builtin";
        options = { desc = "[F]ind [B]uiltin FZF"; };
      };

      "<leader>fw" = {
        action = "grep_cword";
        options = { desc = "[F]ind current [W]ord"; };
      };

      "<leader>fW" = {
        action = "grep_cWORD";
        options = { desc = "[F]ind current [W]ORD"; };
      };
      "<leader>fd" = {
        action = "diagnostics_document";
        options = { desc = "[F]ind [D]iagnostics"; };
      };

      "<leader>fr" = {
        action = "resume";
        options = { desc = "[F]ind [R]esume"; };
      };

      "<leader>fo" = {
        action = "oldfiles";
        options = { desc = "[F]ind [O]ld Files"; };
      };
      "<leader>fz" = {
        action = "zoxide";
        options = { desc = "[F]ind [Z]oxide directory"; };
      };

      "<leader><leader>" = {
        action = "buffers";
        options = { desc = "[ ] Find existing Buffers "; };
      };
      "<leader>bg" = {
        action = "lgrep_curbuf";
        options = { desc = "[bg] Live grep the current buffer"; };
      };

    };
  };
  extraConfigLua = lib.readFile ./extra-lua-config.lua;
}
