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

    # <leader>t
    {
      mode = "n";
      key = "<leader>tn";
      action = "<CMD>tabnew<CR>";
      options.desc = "Create new tab";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<CMD>tabclose<CR>";
      options.desc = "Close tab";
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<CMD>tabnext<CR>";
      options.desc = "Go to the sub-sequent tab";
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = "<CMD>tabprevious<CR>";
      options.desc = "Go to the previous tab";
    }

  ];
}
