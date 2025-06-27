# NixOS Hyprland Configuration - Agent Guidelines

## Build/Test Commands
- `just bs` or `nh os switch . -H <host>` - Build and switch NixOS configuration
- `just hs` or `nh home switch . -c <user>@<host>` - Build and switch Home Manager configuration  
- `just check` or `nix flake check` - Check flake for errors
- `just show` or `nix flake show` - Show flake outputs
- `just update` or `nix flake update` - Update flake inputs
- `just clean` or `nh clean all --keep-since 7d` - Clean old generations
- `nix fmt` - Format Nix files using alejandra formatter

## Code Style Guidelines
- **Language**: Primarily Nix with some Python/Shell scripts
- **Formatting**: Use `alejandra` formatter for Nix files (configured in flake.nix)
- **Imports**: Group imports at top, use relative paths for local modules
- **Structure**: Follow `{ inputs, outputs, ... }: { ... }` pattern for Nix modules
- **Naming**: Use kebab-case for file/directory names, camelCase for Nix attributes
- **Comments**: Minimal comments, prefer self-documenting code
- **Python**: Follow PEP 8, use docstrings for functions, type hints preferred
- **Shell**: Use `#!/usr/bin/env` shebangs, quote variables properly

## Project Structure
- `flake.nix` - Main flake configuration with inputs/outputs
- `hosts/` - NixOS system configurations per machine
- `home/` - Home Manager configurations (user-specific dotfiles)
- `modules/` - Reusable NixOS and Home Manager modules
- `pkgs/` - Custom package definitions and overlays
- `justfile` - Build automation commands