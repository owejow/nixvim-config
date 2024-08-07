# Nixvim Configuration

A standalone nixvim configuration. The entire neovim configuration is
externalized. You can run neovim configuration outside of NixOS configuration.
It can also be run outsie of NixOS altogether.

This configuration took heavy inspiration from the following:

- [Building a standalone nixvim
  configuration](https://gist.github.com/siph/288b7c6b5f68a1902d28aebc95fde4c5)
- [Nevo configuration](https://github.com/redyf/Neve)

Useful documentation and videos for creating nixvim:

- [Nixvim](https://github.com/nix-community/nixvim)
- [User Nixvim Configurations](https://nix-community.github.io/nixvim/user-guide/config-examples.html)
- [Nixvim Docs](https://nix-community.github.io/nixvim/)
- [Quick Setup Tutorial](https://www.youtube.com/watch?v=b641h63lqy0)
- [Configure Neovim with the Power of Nix](https://www.youtube.com/watch?v=GOe0C7Qtypk)

## Running

The configuration can be run from the project folder:

```bash
    nix run
```

The configuration can be run from the public repository using:

```bash
    nix run github:owejow/nixvim-config
```

## Notes

Would like to capture process of refining the neovim configuration file for learning purposes.

### Adding Live Grep Args to Telescope

The package [Live Grep Args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim) enables passing
arguments to the grep command.

The package is not included in the nixvim module but is included in nixpkgs.
The file ./config/extra-plugins.nix contains the declaration to include the plugin:

```nix
    { pkgs, ... }: {
      extraPlugins = with pkgs.vimPlugins; [ telescope-live-grep-args-nvim ];
    }
```

The plugin now needs to be configured inside of telescope. The repository [Live Grep Args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)
contains a sample configuration:

```lua
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup {
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = actions.to_fuzzy_refine,
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        }
      }
    }

    -- don't forget to load the extension
    telescope.load_extension("live_grep_args")
```

This snippet was included via the extraConfigLua option inside of ./config/utils/telescope.nix

```nix
  extraConfigLua =
    # lua
    ''
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                -- freeze the current list and start a fuzzy search in the frozen list
                ["<C-space>"] = actions.to_fuzzy_refine,
              },
            },
            -- ... also accepts theme settings, for example:
            -- theme = "dropdown", -- use dropdown theme
            -- theme = { }, -- use own theme spec
            -- layout_config = { mirror=true }, -- mirror preview pane
          }
        }
      }

      -- don't forget to load the extension
      telescope.load_extension("live_grep_args")
    '';
```

The keymap "<leader>/" is used to trigger the extension. Additional keybindings
inside the window can be defined inside the extraConfigLua declaration.

Todo: create a pull request for this plugin for [Nixvim](https://github.com/nix-community/nixvim)

### Adding Prettier Code Folding

Integrated the [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) plugin into
configuration. Nixvim natively supports this plugin. Added the file
./config/utils/nvim-ufo.nix. Used sample configuration provided in the repo as
a starting point. Folding is much prettier than the default nvim method.

- todo: understand how to configure LSP based folding rather than tree-sitter based folding.

- todo: get preview of code under fold to work as expected

- todo: explore custimizations for specifically used languages

### Customizing Color Scheme

Using the default catppuccin color scheme did not provide enough contrast for the
window separator options. The highlight command in vim is used to specify colors
for various parts of the editor.

The "highlight_overrides" key as added ./config/colorschemes/catppuccin.nix. More
examples on how to customize catppuccin inside neovim can be found at: [Catppuccin Neovim](https://github.com/catppuccin/nvim)

```lua
    highlight_overrides = {
      all = {
        __raw =
          # lua
          ''
            function(colors)
              return {
                  WinSeparator = { fg = colors.surface2 }
                }
            end
          '';
      };
    };

```

The color palletes for the various catppuccin themes can be found at:
[Catppuccin Palette](https://catppuccin.com/palette)

### Debugging Neovim

Some useful tips for debugging neovim issues:

```lua
  -- prints currently loaded packages
   vim.print(package.loaded)
```

```lua
    -- The runtime path for a nixvim is quite long
    vim.print(vim.api.nvim_list_runtime_paths())
```

### How to get hash of git Repository Checkin

1.  make sure that the command nix-prefetch is avaialble. If not,
    you can run this command:

    ```nix
        nix-shell -p nix-prefetch
    ```

2.  run the command to get the nix hash:
    this command:

        ```nix
            nix-prefetch fetchFromGitHub --owner nvim-lua --repo plenary.nvim --rev a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683
        ```

3.  The sha256 hash printed at the bottom of the output is the expected has:

```verbatim

    The fetcher will be called as follows:
    > fetchFromGitHub {
    >   owner = "nvim-lua";
    >   repo = "plenary.nvim";
    >   rev = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683";
    >   sha256 = "sha256:0000000000000000000000000000000000000000000000000000";
    > }

    sha256-5Jf2mWFVDofXBcXLbMa417mqlEPWLA+cQIZH/vNEV1g=

```
