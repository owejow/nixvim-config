{
  globals.mapleader = " ";
  keymaps = [
    {
      key = "<leader>-";
      action = "<C-W>s";
      options.desc = "Split Window Below";
    }
    {
      key = "<leader>|";
      action = "<C-W>v";
      options.desc = "Split Window Right";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>qa<cr>";
      options.desc = "Quit";
    }

    # <leader>c
    {
      mode = "n";
      key = "<leader>ci";
      options.desc = "Organize Imports";
      action = {
        __raw =
          # lua
          ''
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports" },
                  diagnostics = {},
                },
              })
            end
          '';
      };
    }
  ];
}
