{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];

        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        css = [ "prettierd" ];

        go = [
          "goimports"
          "golines"
          "gofmt"
          "gofumpt"
        ];
        graphql = [ "prettierd" ];
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "biome";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        javascriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "biome";
          timeout_ms = 2000;
          stop_after_first = true;
        };

        json = [ "jq" ];
        jsonc = [ "prettierd" ];
        html = [ "prettierd" ];

        less = [ "prettierd" ];
        lua = [ "stylua" ];
        markdown = [ "prettierd" ];
        nix = [ "nixfmt" ];
        python = [
          "isort"
          "ruff"
        ];
        rust = [ "rustfmt" ];
        scss = [ "prettierd" ];
        sh = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        toml = [ "prettierd" ];
        typescript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "biome";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        typescriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "biome";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        yaml = [ "yamlfmt" ];

      };

      formatters = {
        biome = {
          command = lib.getExe pkgs.biome;
          env = {
            BIOME_CONFIG_PATH = pkgs.writeTextFile {
              name = "biome.json";
              text = lib.generators.toJSON { } {
                "$schema" = "${pkgs.biome}/node_modules/@biomejs/biome/configuration_schema.json";
                formatter.useEditorconfig = true;
              };
            };
          };
        };
        #c.command = lib.getExe pkgs.clang_format;
        # clang-format.command = lib.getExe pkgs.clang_format;
        # cmake-format.command = lib.getExe pkgs.cmake-format;
        # golines.command = lib.getExe pkgs.golines;
        # isort.command = lib.getExe pkgs.isort;
        # jq.command = lib.getExe pkgs.jq;
        # nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
        # prettierd.command = lib.getExe pkgs.prettierd;
        # ruff.command = lib.getExe pkgs.ruff;
        # rustfmt.command = lib.getExe pkgs.rustfmt;
        # shellcheck.command = lib.getExe pkgs.shellcheck;
        # shellharden.command = lib.getExe pkgs.shellharden;
        # shfmt.command = lib.getExe pkgs.shfmt;
        # squeeze_blanks.command = pkgs.coreutils "cat";
        # sqlfluff.command = lib.getExe pkgs.sqlfluff;
        # stylelint.command = lib.getExe pkgs.stylelint;
        # stylua.command = lib.getExe pkgs.stylua;
        # terraform_fmt.command = lib.getExe pkgs.terraform;
        # yamlfmt.command = lib.getExe pkgs.yamlfmt;
      };

      format_on_save = ''
        function(bufnr)
        local ignore_filetypes = { "helm" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
        end

        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
        end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
        return
        end
        return { timeout_ms = 2000, lsp_fallback = true }
        end
      '';
    };
  };
}
