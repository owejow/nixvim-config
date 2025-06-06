{ lib, nixpkgs-stable, ... }:
let
  pkgs = nixpkgs-stable;
in
{
  plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        bash = [ "shellcheck" ];
        c = [ "clangtidy" ];
        cpp = [ "clangtidy" ];
        css = [ "stylelint" ];
        elixir = [ "credo" ];
        go = [ "golangcilint" ];
        html = [ "htmlhint" ];
        javascript = [ "biomejs" ];
        json = [ "jsonlint" ];
        lua = [ "luacheck" ];
        markdown = [ "markdownlint" ];
        rust = [ "clippy" ];
        sh = [ "shellcheck" ];
        sql = [ "sqlfluff" ];
        typescript = [ "biomejs" ];
        yaml = [ "yamllint" ];
      };
      linters = {
        biomejs.cmd = lib.getExe pkgs.biome;
        clangtidy.cmd = lib.getExe' pkgs.clang-tools "clang-tidy";
        clippy.cmd = lib.getExe pkgs.rust-analyzer;
        deadnix.cmd = lib.getExe pkgs.deadnix;
        golangcilint.cmd = lib.getExe pkgs.golangci-lint;
        htmlhint.cmd = lib.getExe pkgs.htmlhint;
        jsonlint.cmd = lib.getExe pkgs.nodePackages.jsonlint;
        luacheck.cmd = lib.getExe pkgs.luaPackages.luacheck;
        markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
        nix.cmd = lib.getExe' pkgs.nix "nix-instantiate";
        pylint.cmd = lib.getExe pkgs.pylint;
        shellcheck.cmd = lib.getExe pkgs.shellcheck;
        sqlfluff.cmd = lib.getExe pkgs.sqlfluff;
        stylelint.cmd = lib.getExe pkgs.stylelint;
        yamllint.cmd = lib.getExe pkgs.yamllint;
      };
    };
  };

  autoCmd = [
    {
      event = [
        "BufEnter"
        "BufWritePost"
        "InsertLeave"
      ];
      pattern = [ "*" ];
      command = ''silent! lua require("lint").try_lint()'';
    }
  ];
}
