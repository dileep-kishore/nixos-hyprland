<h1 align="center">
    <a name="top" title="nixos-hyprland">
        nixos-hyprland
    </a>
    <br/>
    <br/>
    <br/>
    <sup>
        <a href="https://nixos.org"><img src="https://avatars.githubusercontent.com/u/487568?s=200&v=4"></a>
    </sup>
        <br/>
        <sub>
            <img src="https://forthebadge.com/images/badges/built-with-science.svg">
            <img src="https://forthebadge.com/images/badges/powered-by-black-magic.svg">
        </sub>
    </sup>
</h1>

<div align="center">
    Dotfiles for my <a href="https://hyprland.org">Hyprland</a> setup on my <a href="https://nixos.org">NixOS</a> system.
    <p><strong>Be sure to <a href="#" title="star">⭐️</a> or <a href="#" title="fork">🔱</a> this repo if you find it useful! 😃</strong></p>
</div>

> **Note:** This is a work in progress. I'm new to nix and am still working on this setup.

## Setup

- `NixOS`
- `Hyprland`
- `Waybar`
- `Zsh` with `antidote`
- Current theme: [Catppuccin](https://github.com/catppuccin/catppuccin)
- Font: [Recursive](https://www.recursive.design)

## Screenshots

|                        | Image                     |
| ---------------------- | ------------------------- |
| Desktop                | ![](assets/desktop.png)   |
| Terminal + Tmux        | ![](assets/terminals.png) |
| VSCode                 | ![](assets/vscode.png) |
| Neovim                 | Coming soon.    |

## Installation

```sh
sudo nixos-rebuild switch --flake '.#tsuki'
```