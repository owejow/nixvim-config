{
  plugins.none-ls = {
    enable = true;
    settings = {
      on_attach =
        # lua
        ''
          function(client, bufnr)
            if client.supports_method "textDocument/formatting" then
              vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  if (format_enabled()) then
                    vim.lsp.buf.format { bufnr = bufnr }
                  end
                end,
              })
            end
          end
        '';
    };
    sources = {
      diagnostics = {
        golangci_lint.enable = true;
        statix.enable = true;
      };
      formatting = {
        gofmt.enable = true;
        goimports.enable = true;
        nixfmt.enable = true;
        markdownlint.enable = true;
        shellharden.enable = true;
        shfmt.enable = true;
        stylua.enable = true;
        clang_format.enable = true;
        black.enable = true;
        isort.enable = true;
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        mix = {
          enable = true;
          withArgs =
            # lua
            ''
              {
                extra_args = { "format" },
              }
            '';
        };
      };
    };
  };

  keymaps = [

    {
      mode = "n";
      key = "<leader>uf";
      action = {
        __raw =
          # lua
          ''
            function()
              toggle_format()
            end
          '';
      };
      options.desc = "Toggle Auto Format (Global)";
    }
    {
      mode = "n";
      key = "<leader>uF";
      action = {
        __raw =
          # lua
          ''
            function()
              toggle_format(true)
            end
          '';
      };
      options.desc = "Toggle Auto Format (Buffer)";
    }
  ];

  extraConfigLua =
    # lua
    ''
      function format_enabled() 
        local buf = vim.api.nvim_get_current_buf()
        local gaf = vim.g.autoformat
        local baf = vim.b[buf].autoformat

        -- If the buffer has a local value, use that
        if baf ~= nil then
          return baf
        end

        -- Otherwise use the global value if set, or true by default
        return gaf == nil or gaf
      end

      function toggle_format(buf)
        if buf then
          vim.b.autoformat = not format_enabled()
        else
          vim.g.autoformat = not format_enabled()
          vim.b.autoformat = nil
        end
        format_info()
      end

      function format_info()
        local buf = vim.api.nvim_get_current_buf()
        local gaf = vim.g.autoformat == nil or vim.g.autoformat
        local baf = vim.b[buf].autoformat
        local enabled = format_enabled()
        local lines = {
          ("- [%s] global **%s**"):format(gaf and "x" or " ", gaf and "enabled" or "disabled"),
          ("- [%s] buffer **%s**"):format(
            enabled and "x" or " ",
            baf == nil and "inherit" or baf and "enabled" or "disabled"
          ),
        }
        vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, {
          title = "Auto Format Status",
          on_open = function(win)
              local buf = vim.api.nvim_win_get_buf(win)
              vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
            end,
        }) 
      end

    '';
}
