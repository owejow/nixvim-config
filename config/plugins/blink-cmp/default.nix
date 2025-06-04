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
      wordnet # has wn utility
    ]
  );

  extraPlugins = with pkgs.vimPlugins; [
    blink-nerdfont-nvim
    blink-cmp-spell
    blink-cmp-dictionary
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
              draw = {
                columns = [
                  {
                    __unkeyed-1 = "label";
                  }
                  {
                    __unkeyed-1 = "kind_icon";
                    __unkeyed-2 = "kind";
                    gap = 1;
                  }
                  { __unkeyed-1 = "source_name"; }
                ];
                components = {
                  kind_icon = {
                    ellipsis = false;
                    text.__raw = ''
                      function(ctx)
                        local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                        -- Check for both nil and the default fallback icon
                        if not kind_icon or kind_icon == '󰞋' then
                          -- Use our configured kind_icons
                          return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                        end
                        return kind_icon
                      end,
                      -- Optionally, you may also use the highlights from mini.icons
                      highlight = function(ctx)
                        local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                        return hl
                      end
                    '';
                  };
                };
              };
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
              "dictionary"
              "emoji"
              "lsp"
              "nerdfont"
              "path"
              "snippets"
              "spell"
            ];
            providers = {
              # BUILT-IN SOURCES
              lsp.score_offset = 4;
              dictionary = {
                name = "Dict";
                module = "blink-cmp-dictionary";
                min_keyword_length = 3;
              };
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 1;
              };

              spell = {
                name = "Spell";
                module = "blink-cmp-spell";
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

      blink-cmp-dictionary.enable = true;
      blink-cmp-spell.enable = true;
      blink-emoji.enable = true;
    }
  ];
}
