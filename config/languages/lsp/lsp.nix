{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        elixirls.enable = true;
        gopls.enable = true;
        lua-ls.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        ruff-lsp.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        tailwindcss.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
        zls.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
        "<leader>cm" = "format";
        "<leader>cr" = "rename";
        "<leader>ca" = "code_action";
      };
    };
    inc-rename.enable = true;
    lsp-lines.enable = true;
    rust-tools.enable = true;
  };

  diagnostics = { virtual_lines.only_current_line = true; };
}
