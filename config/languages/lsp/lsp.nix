{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        elixirls.enable = true;
        gopls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        ruff.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;
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
  };

  diagnostics.settings = { virtual_lines.only_current_line = true; };
}
