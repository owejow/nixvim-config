{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        cssls.enable = true;
        clangd.enable = true;
        elixirls.enable = true;
        gopls.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        jsonls.enable = true;
        marksman.enable = true;
        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "nixpkgs-fmt" ];
            nixpkgs.expr = "import <nixpkgs> {}";
          };
        };
        pyright.enable = true;
        ruff.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;
        yamlls.enable = true;
        zls.enable = true;

      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gr" = "references";
        "gD" = "declaration";
        "gT" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
        "<leader>cm" = "format";
        "<leader>cr" = "rename";
        "<leader>ca" = "code_action";
        "<C-s>" = "signature_help";
      };

    };
    inc-rename.enable = true;
    lsp-lines.enable = true;
  };

  diagnostic.settings = {
    virtual_lines.only_current_line = true;
  };
  # extraConfigLua = lib.readFile ./lsp-extra-lua-config.lua;
}
