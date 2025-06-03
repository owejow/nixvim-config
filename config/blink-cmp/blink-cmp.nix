_: {
  plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      autoLoad = true;

      settings = {
        appearance = {
          use_nvim_cmp_as_default = true;
          nerd_font_variant = "mono";
          # Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
          kind_icons = {
            Class = "󱡠";
            Color = "󰏘";
            Constant = "󰏿";
            Constructor = "󰒓";
            Copilot = "";
            Enum = "󰦨";
            EnumMember = "󰦨";
            Event = "󱐋";
            Field = "󰜢";
            File = "󰈔";
            Folder = "󰉋";
            Function = "󰊕";
            Interface = "󱡠";
            Keyword = "󰻾";
            Method = "󰊕";
            Module = "󰅩";
            Operator = "󰪚";
            Property = "󰖷";
            Reference = "󰬲";
            Snippet = "󱄽";
            Struct = "󱡠";
            Text = "󰉿";
            TypeParameter = "󰬛";
            Unit = "󰪚";
            Value = "󰦨";
            Variable = "󰆦";
          };
        };
        completion = {
          accept = {
            auto_brackets = {
              enabled = false;
            };
          };

          documentation = {
            auto_show = false;
            auto_show_delay_ms = 200;

            window = {
              border = "rounded";
            };
          };

          ghost_text = {
            enabled = true;
          };
        };
        fuzzy = {
          implementation = "rust";
        };
        snippets = {
          preset = "luasnip";
        };

        keymap = {
          preset = "default";
        };
        signature = {
          enabled = true;
          window = {
            border = "rounded";
          };
        };
        sources = {
          default = [
            "buffer"
            "cmdline"
            "lsp"
            "path"
            "snippets"
            "omni"
          ];

          providers = {
            lsp = {
              name = "LSP";
              module = "blink.cmp.sources.lsp";
              async = false;
              enabled = true;
              max_items = null;
              min_keyword_length = 0;
              override = null;
              score_offset = 4;
              should_show_items = true;
              timeout_ms = 2000;
            };
            omni = {
              name = "Omini";
              module = "blink.cmp.sources.complete_func";
              score_offset = 10;

            };

            buffer = {
              name = "buffer";
              module = "blink.cmp.sources.buffer";
              score_offset = 0;
            };

            cmdline = {
              name = "cmdline";
              module = "blink.cmp.sources.cmdline";
              score_offset = 0;
            };

            path = {
              name = "path";
              module = "blink.cmp.sources.path";
              score_offset = 0;
              fallbacks = [ "buffer" ];
              opts = {
                label_trailing_slash = true;
                show_hidden_files_by_default = false;
                trailing_slash = false;
              };
            };

            #ripgrep = {
            #  async = true;
            #  module = "blink-ripgrep";
            #  name = "ripgrep";
            #  score_offset = 100;
            #  opts = {
            #    prefix_min_len = 3;
            #    context_size = 5;
            #    max_filesize = "1M";
            #    project_root_marker = ".git";
            #    project_root_fallback = true;
            #    search_casing = "--ignore-case";
            #    additional_rg_options = { };
            #    fallback_to_regex_highlighting = true;
            #    ignore_paths = { };
            #    additional_paths = { };
            #    debug = false;
            #  };

            #};

          };
        };
      };
    };
  };
}
