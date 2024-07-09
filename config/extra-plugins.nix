{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ telescope-live-grep-args-nvim ];
}
