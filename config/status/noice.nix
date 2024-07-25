{
  plugins.noice = {
    enable = true;
    notify = { enabled = true; };
    messages = { enabled = true; };

    presets = {
      bottom_search = true;
      command_palette = false;
      long_message_to_split = true;
      inc_rename = false;
      lsp_doc_border = false;
    };
    lsp = {
      message = { enabled = true; };
      progress = {
        enabled = true;
        view = "mini";
      };
      override = {
        # added to remove warnings in checkhealth  if these options are set to false 
        # need to resolve: https://github.com/folke/noice.nvim/issues/575
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    format = {
      filter = {
        pattern = [
          ":%s*%%s*s:%s*"
          ":%s*%%s*s!%s*"
          ":%s*%%s*s/%s*"
          "%s*s:%s*"
          ":%s*s!%s*"
          ":%s*s/%s*"
        ];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [
          ":%s*%%s*s:%w*:%s*"
          ":%s*%%s*s!%w*!%s*"
          ":%s*%%s*s/%w*/%s*"
          "%s*s:%w*:%s*"
          ":%s*s!%w*!%s*"
          ":%s*s/%w*/%s*"
        ];
        icon = "󱞪";
        lang = "regex";
      };
    };
    routes = [{
      # Filter out write messages
      filter = {
        event = "msg_show";
        kind = "";
        find = "written";
      };

      opts = { skip = true; };
    }];
  };
}
