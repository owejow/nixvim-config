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
                  vim.lsp.buf.format { bufnr = bufnr }
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
}
