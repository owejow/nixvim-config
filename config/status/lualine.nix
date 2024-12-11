{
  plugins.lualine = {
    enable = true;
    settings = {
      globalstatus = true;
      extensions = [ "neo-tree" ];
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        #lualine_c = [
        #  {
        #    name = "filetype";
        #    extraConfig = {
        #      icon_only = true;
        #      separator = "";
        #      padding = {
        #        left = 1;
        #        right = 0;
        #      };
        #    };
        #  }
        #  "filename"
        #];

        lualine_c = [
          "filetype"
          {
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          "filename"
        ];

        lualine_x = [
          # lua
          ''
            require("noice").api.status.command.get()
          ''
          # lua
          ''
            (vim.fn.reg_recording() == "" and "") or "Recording @" .. vim.fn.reg_recording()
          ''
          "diff"
          {
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
            source =
              # lua
              ''
                function()
                   local gitsigns = vim.b.gitsigns_status_dict
                   if gitsigns then
                     return {
                       added = gitsigns.added,
                       modified = gitsigns.changed,
                       removed = gitsigns.removed,
                     }
                   end
                 end
              '';
          }
        ];
        lualine_y = [
          "progress"
          {
            separator = " ";
            padding = {
              left = 1;
              right = 0;
            };
          }
          "location"
          {
            padding = {
              left = 0;
              right = 1;
            };
          }
        ];
        lualine_z = [
          # lua
          ''
            " " .. os.date("%R")
          ''
        ];
      };
    };
  };
}
