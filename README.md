# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

Set up a new machine with a single command:

```bash
curl -sfL https://raw.githubusercontent.com/trysgaard/dotfiles/main/.setup.sh | bash
```

Or manually:

```bash
chezmoi init --apply trysgaard
```

## What's Included

- **Shell Configuration**: Oh My Zsh with custom theme and plugins
- **Git Configuration**: User settings, aliases, and editor preferences
- **macOS System Settings**: Dock, Finder, appearance preferences, and Dark Mode
- **Development Tools**: Homebrew packages, VS Code extensions
- **Package Management**: Automated installation via Brewfile

## Structure

- `.chezmoi.toml` - Chezmoi configuration and user data
- `.setup.sh` - One-command setup script
- `Brewfile.tmpl` - Homebrew packages and applications
- `run_once_install-packages.sh` - One-time setup script for packages and system preferences
- `run_onchange_brew-packages.sh.tmpl` - Script that runs when Brewfile changes
- `*.tmpl` - Template files for configuration

## Customization

Edit the `.chezmoi.toml` file to customize your setup:

```toml
[data]
    name = "Your Name"
    email = "your.email@example.com"
    github_username = "your-github-username"
```

## Updating

To update your dotfiles on existing machines:

```bash
chezmoi update
```

## What the Setup Does

The `run_once_install-packages.sh` script:

1. **Sets macOS preferences**:
   - Enables Dark Mode
   - Configures Dock (left position, auto-hide)
   - Configures Finder (show all files, list view, path bar, status bar)

2. **Installs development tools**:
   - Homebrew (if not present)
   - Mac App Store CLI (mas)
   - Packages from Brewfile
   - Oh My Zsh

3. **Restarts affected applications** (Dock, Finder)

## Development

To make changes to your dotfiles:

```bash
chezmoi edit ~/.zshrc  # Edit a specific file
chezmoi cd             # Open source directory
chezmoi apply          # Apply changes
```

## Included Packages

### Development Tools
- `htop` - System monitoring
- `pyenv` - Python version management
- `tree` - Directory tree visualization
- `git` - Version control
- `mas` - Mac App Store CLI

### Applications
- `spotify` - Music streaming
- `Speedtest by Ookla` - Internet speed testing

### VS Code Extensions
- Python development tools
- Swift development tools
- GitHub Copilot
- Markdown support
- Debugging tools

## Requirements

- macOS (tested on macOS 14+)
- Internet connection for package downloads
- Administrator privileges for system settings 