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
