{
  plugins.nvim-ufo = {
    enable = true;

    extraOptions = {
      open_fold_hl_timeout = 150;
      close_fold_kinds_for_ft = {
        default = [ "imports" "comment" ];
        json = [ "array" ];
        c = [ "comment" "region" ];
      };
      preview = {
        win_config = {
          border = [ "" "─" "" "" "" "─" "" "" ];
          winhighlight = "Normal:Folded";
          winblend = 0;
        };
      };
      provider_selector = {
        __raw =
          # lua
          ''
            function(bufnr, filetype, buftype)
                -- if you prefer treesitter provider rather than lsp,
                -- return ftMap[filetype] or {'treesitter', 'indent'}
                return {'treesitter', 'indent'}
            end
          '';
      };
    };
  };
  keymaps = [{
    key = "zr";
    mode = "n";
    action = { __raw = "require('ufo').openAllFolds"; };
    options.desc = "open all folds";
  }];
}
