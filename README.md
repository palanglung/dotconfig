# dotconfig

A streamlined dotfiles management system for macOS
that automates the installation and configurationo
of your favorite command-line tools and applications.

## Overview

This repository contains a collection of configuration files (dotfiles)
and installation scripts to quickly set up a consistent development environment.
It uses GNU Stow to manage symlinks and Homebrew to install packages.

## Features

- **Automated Installation**: Single command to install all tools or individual app
- **Modular Design**: Each application has its own installation and configuration
- **macOS Support**: Optimized for macOS environments
- **Configuration Management**: Uses GNU Stow to manage dotfiles

## Included Applications

- zsh - The Z shell
- tmux - Terminal multiplexer
- fzf - Command-line fuzzy finder
- nvim - Neovim text editor
- lsd - Modern ls alternative
- starship - Customizable shell prompt
- terminal - Terminal configuration

## Prerequisites

- macOS (currently the only supported OS)
- Git
- Internet connection

## Installation

### Full Installation

To install all applications and configurations:

```bash
./install.sh
```

### Selective Installation

To install only specific applications:

```bash
./install.sh zsh tmux nvim
```

Replace `zsh tmux nvim` with any combination of available applications.

## How It Works

1. The script detects your operating system
2. Installs required dependencies (Homebrew, GNU Stow, etc.)
3. For each application:
   - Installs the application if not already installed
   - Backs up existing configurations
   - Symlinks the new configurations using GNU Stow

## Customization

You can add your own applications by creating new scripts in
the `install/app/` directory following the existing pattern.

### zsh

if you want to add privates private data or local only configurations
use *.local.zsh file for each configurations

## License

See the [LICENSE](LICENSE) file for details.
