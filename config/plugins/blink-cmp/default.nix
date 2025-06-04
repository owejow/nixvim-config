{
  config,
  lib,
  pkgs,
  ...
}:
{
  extraPackages = lib.mkIf config.plugins.blink-cmp.enable (
    with pkgs;
    [
      curl
      git
      fzf
    ]
  );

  extraPlugins = with pkgs.vimPlugins; [
    blink-nerdfont-nvim
  ];
  plugins = lib.mkMerge [
    {
      blink-cmp = {
        enable = true;

        settings = {
          cmdline = {
            completion = {
              list.selection = {
                preselect = false;
              };
              menu.auto_show = true;
            };
          };
          completion = {
            ghost_text.enabled = true;
            documentation = {
              auto_show = true;
              window.border = "rounded";
            };

            list.selection = {
              auto_insert = false;
              preselect = true;
            };
            menu = {
              border = "rounded";
            };
          };
          fuzzy = {
            implementation = "rust";
            prebuilt_binaries = {
              download = false;
            };
          };
          appearance = {
            use_nvim_cmp_as_default = true;
            nerd_font_variant = "mono";
          };
          keymap = {
            preset = "default";
          };
          signature = {
            enabled = true;
            window.border = "rounded";
          };
          sources = {
            default = [
              "buffer"
              "emoji"
              "lsp"
              "nerdfont"
              "path"
              "snippets"
            ];
            providers = {
              # BUILT-IN SOURCES
              lsp.score_offset = 4;
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 1;
              };

              nerdfont = {
                module = "blink-nerdfont";
                name = "Nerd Fonts";
                score_offset = 15;
                opts = {
                  insert = true;
                };
              };

            };
          };
        };
      };

      blink-emoji.enable = true;
    }
  ];
}
