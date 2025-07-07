{ config, lib, ... }:
{
  plugins.markview =
    let
      filetypes = [
        "Avante"
        "codecompanion"
        "latex"
        "markdown"
        "md"
        "norg"
        "org"
        "quarto"
        "rmd"
        "typst"
        "vimwiki"
      ];
    in
    {
      enable = true;

      settings = {
        preview = {
          inherit filetypes;

          ignore_buftypes = [ ];

          condition.__raw = ''
            function (buffer)
               local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt;

               if bt == "nofile" and (ft == "Avante" or ft == "codecompanion") then
                    return true;
               elseif bt == "nofile" then
                    return false;
               else
                    return true;
               end
            end
          '';
        };
      };
    };

  keymaps = lib.mkIf config.plugins.markview.enable [
    {
      mode = "n";
      key = "<leader>umt";
      action = "<cmd>Markview toggle<CR>";
      options = {
        desc = "Toggle Markdown Preview";
      };
    }
    {
      mode = "n";
      key = "<leader>umd";
      action = "<cmd>Markview Disable<CR>";
      options = {
        desc = "Disable Markdown Preview";
      };
    }

    {
      mode = "n";
      key = "<leader>ume";
      action = "<cmd>Markview Enable<CR>";
      options = {
        desc = "Enable Markdown Preview";
      };
    }
  ];
}
