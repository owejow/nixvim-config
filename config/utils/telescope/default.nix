{ pkgs, ... }: {
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native = { enable = true; };
      ui-select = { settings = { specific_opts = { codeactions = true; }; }; };
      undo = { enable = true; };
    };

    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep_args";
        options.desc = "Live Grep (root dir)";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Buffers";
      };
      "<leader>fg" = {
        action = "git_files";
        options.desc = "Search git files";
      };
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Buffer";
      };
      "<leader>sc" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>sC" = {
        action = "commands";
        options.desc = "Commands";
      };
      "<leader>sd" = {
        action = "diagnostics";
        options.desc = "Workspace diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Help pages";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "Keymaps";
      };
      "<leader>sm" = {
        action = "man_pages";
        options.desc = "Man pages";
      };
      "<leader>so" = {
        action = "vim_options";
        options.desc = "Options";
      };
      "<leader>sr" = {
        action = "resume";
        options.desc = "Resume";
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [ telescope-live-grep-args-nvim ];

}
