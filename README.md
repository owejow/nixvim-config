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

