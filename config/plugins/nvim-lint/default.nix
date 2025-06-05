{
  plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        bash = [ "shellcheck" ];
        c = [ "clangtidy" ];
        cmake = [ "cmakelint" ];
        cpp = [ "clangtidy" ];
        css = [ "stylelint" ];
        elixir = [ "credo" ];
        go = [ "golangcilint" ];
        html = [ "htmlhint" ];
        javascript = [ "biomejs" ];
        json = [ "jsonlint" ];
        lua = [ "luacheck" ];
        make = [ "checkmake" ];
        markdown = [ "markdownlint" ];
        rust = [ "clippy" ];
        sh = [ "shellcheck" ];
        sql = [ "sqlfluff" ];
        typescript = [ "biomejs" ];
        yaml = [ "yamllint" ];
      };
    };
  };
}
