{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        elixirls.enable = true;
        gopls.enable = true;
        nixd.enable = true;
        ruff-lsp.enable = true;
        lua-ls.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    lsp-lines = { enable = true; };
    rust-tools.enable = true;
  };

  diagnostics = { virtual_lines.only_current_line = true; };
}
