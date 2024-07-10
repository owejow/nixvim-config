# # Source: https://github.com/hmajid2301/dotfiles/blob/ab7098387426f73c461950c7c0a4f8fb4c843a2c/home-manager/editors/nvim/plugins/coding/cmp.nix
{
  plugins = {
    luasnip.enable = true;

    cmp-buffer = { enable = true; };

    cmp-nvim-lsp = { enable = true; };

    cmp-path = { enable = true; };

    cmp_luasnip = { enable = true; };

    cmp = {
      enable = true;

      settings = {
        experimental = { ghost_text = true; };
        snippet.expand =
          # lua
          ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          { name = "nvim_lua"; }
          { name = "path"; }
        ];

        formatting = {
          fields = [ "abbr" "kind" "menu" ];
          format =
            # lua
            ''
              function(_, item)
                 local icons = {
                   Namespace = "󰌗",
                   Text = "󰉿",
                   Method = "󰆧",
                   Function = "󰆧",
                   Constructor = "",
                   Field = "󰜢",
                   Variable = "󰀫",
                   Class = "󰠱",
                   Interface = "",
                   Module = "",
                   Property = "󰜢",
                   Unit = "󰑭",
                   Value = "󰎠",
                   Enum = "",
                   Keyword = "󰌋",
                   Snippet = "",
                   Color = "󰏘",
                   File = "󰈚",
                   Reference = "󰈇",
                   Folder = "󰉋",
                   EnumMember = "",
                   Constant = "󰏿",
                   Struct = "󰙅",
                   Event = "",
                   Operator = "󰆕",
                   TypeParameter = "󰊄",
                   Table = "",
                   Object = "󰅩",
                   Tag = "",
                   Array = "[]",
                   Boolean = "",
                   Number = "",
                   Null = "󰟢",
                   String = "󰉿",
                   Calendar = "",
                   Watch = "󰥔",
                   Package = "",
                   Copilot = "",
                   Codeium = "",
                   TabNine = "",
                 }

                item.kind = string.format("%s %s", icons[item.kind] or "", item.kind)

                local widths = {
                  abbr = 40,
                  menu = 30,
                }

                for key, width in pairs(widths) do
                  if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                    item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                  end
                end

                return item
              end
            '';
        };

        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<Up>" = "cmp.mapping.select_prev_item()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Enter>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" =
            # lua
            ''
              function(fallback)
                if require("luasnip").jumpable(1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-next", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
      };
    };
  };

}
