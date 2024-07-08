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

```ba
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
                ["<C-space>"] = lga_actions.to_fuzzy_refine,
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

Todo:  create a pull request for this plugin for [Nixvim](<https://github.com/nix-community/nixvim>)
