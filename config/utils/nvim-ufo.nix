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
        mappings = {
          scrollU = "<C-u>";
          scrollD = "<C-d>";
          jumpTop = "[";
          jumpBot = "]";
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
  keymaps = [
    {
      key = "zR";
      mode = "n";
      action = { __raw = "require('ufo').openAllFolds"; };
      options.desc = "open all folds";
    }
    {
      key = "zM";
      mode = "n";
      action = { __raw = "require('ufo').closeAllFolds"; };
      options.desc = "close all folds";
    }
    {
      key = "zr";
      mode = "n";
      action = { __raw = "require('ufo').openFoldsExceptKinds"; };
      options.desc = "open folds except kinds";
    }
    {
      key = "zm";
      mode = "n";
      action = { __raw = "require('ufo').closeFoldsWith"; };
      options.desc = "close folds with";
    }
    {
      key = "K";
      mode = "n";
      options.desc = "peek into fold";
      action = {
        __raw =
          # lua
          ''
            function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    -- choose one of coc.nvim and nvim lsp
                    vim.fn.CocActionAsync('definitionHover') -- coc.nvim
                    vim.lsp.buf.hover()
                end
            end

          '';
      };
    }
  ];
}
