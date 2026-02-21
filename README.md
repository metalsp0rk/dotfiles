# Dotfiles

This repository manages user configuration files (dotfiles) using [GNU Stow](https://www.gnu.org/software/stow/) and a Makefile-based workflow. It provides a systematic way to version control your system configurations and easily deploy them across multiple machines.

## Table of Contents

- [Quick Start](#quick-start)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Creating Packages](#creating-packages)
- [Troubleshooting](#troubleshooting)
- [Advanced Usage](#advanced-usage)

## Quick Start

```sh
# Clone the repository
git clone <repository-url> ~/.dots
cd ~/.dots

# Install base dependencies and set up
make install-base

# Enable a configuration package
make add config=zsh

# Run any post-install configuration scripts
make configure
```

## Prerequisites

### Required

- **stow** - GNU Stow for managing symlinks
- **make** - GNU Make for automation
- **git** - Version control
- **zsh** - Shell used for automation scripts

### Optional (Auto-installed on Arch Linux)

- **yay** - AUR helper (automatically installed if `pacman` is available)

### Installing Dependencies

**Arch Linux:**
```sh
sudo pacman -S stow make git zsh
```

**Debian/Ubuntu:**
```sh
sudo apt-get install stow make git zsh
```

**Fedora:**
```sh
sudo dnf install stow make git zsh
```

**macOS (with Homebrew):**
```sh
brew install stow make git zsh
```

## Installation

### Step 1: Clone the Repository

```sh
git clone <repository-url> ~/.dots
cd ~/.dots
```

### Step 2: Install Base Configuration

```sh
make install-base
```

This command:
- Creates necessary directories (`~/.zenv.d/` and `~/.local/stow-run.d/`)
- Installs `stow` if not available (on supported systems)
- Installs `yay` on Arch Linux (if not present)
- Creates the empty `stow.env` file

### Step 3: Enable Configuration Packages

Enable the packages you want to use:

```sh
# Enable Z shell configuration
make add config=zsh

# Enable Neovim configuration
make add config=nvim

# Enable Git configuration
make add config=git
```

### Step 4: Run Configuration Scripts

Some packages include post-install scripts to set up additional dependencies:

```sh
make configure
```

This runs any scripts found in `~/.local/stow-run.d/` corresponding to enabled packages.

## Usage

### Basic Commands

**Install all enabled configurations:**
```sh
make install
```
Reads `~/.zenv.d/stow.env` and symlinks all enabled packages.

**Enable a new package:**
```sh
make add config=<package_name>
```
Example: `make add config=zsh`

**Disable a package:**
```sh
make rm config=<package_name>
```
Alternative commands: `make remove config=<package_name>` or `make delete config=<package_name>`

**Update symlinks:**
```sh
make update
```
Refreshes all symlinks. Use this after adding or removing files within existing packages.

**Uninstall all configurations:**
```sh
make uninstall
```
Removes all symlinks for enabled packages.

**List enabled packages:**
```sh
make enabled
```
Shows all currently enabled configuration packages.

**Run configuration scripts:**
```sh
make configure
```
Executes post-install scripts for all enabled packages.

### Command Reference

| Command | Description | Example |
|---------|-------------|---------|
| `make install-base` | Set up directories and install stow | `make install-base` |
| `make install` | Install all enabled packages | `make install` |
| `make add config=<pkg>` | Enable and install a package | `make add config=zsh` |
| `make rm config=<pkg>` | Disable and remove a package | `make rm config=zsh` |
| `make update` | Refresh all symlinks | `make update` |
| `make uninstall` | Remove all enabled packages | `make uninstall` |
| `make enabled` | List enabled packages | `make enabled` |
| `make configure` | Run post-install scripts | `make configure` |

## Project Structure

### Directory Layout

```
~/.dots/
├── AGENTS.md              # Guidelines for AI agents
├── Makefile               # Automation scripts
├── README.md              # This file
├── zsh/                   # Z shell configuration package
│   ├── .zshrc            # Zsh config file
│   ├── .zprofile         # Zsh profile
│   ├── .config/          # Additional configs
│   ├── .local/
│   │   ├── bin/          # Executable scripts
│   │   └── stow-run.d/   # Post-install scripts
│   │       └── zsh.sh    # Zsh setup script
├── nvim/                  # Neovim configuration package
│   └── .config/nvim/     # Neovim config directory
├── git/                   # Git configuration package
│   ├── .gitconfig
│   └── .gitignore_global
└── ...
```

### How It Works

Each top-level directory is a **stow package**. The directory structure inside each package mirrors the target location in your home directory:

```
Repository:          Symlink Target:
zsh/.zshrc       →   ~/.zshrc
zsh/.config/foo  →   ~/.config/foo
zsh/.local/bin/  →   ~/.local/bin/
```

### Stow Configuration

Enabled packages are tracked in `~/.zenv.d/stow.env`:

```sh
export stow_configs=zsh,nvim,git,htop
```

### Special Directories

- **`.local/bin/`** - Executable scripts are placed here and become available in your PATH
- **`.local/stow-run.d/`** - Post-install scripts that run when `make configure` is executed
  - Scripts are named `<package>.sh` and must be executable

## Creating Packages

### Adding a New Package

1. **Create the package directory:**

   ```sh
   mkdir -p ~/.dots/my-app
   ```

2. **Add configuration files mirroring the target structure:**

   ```
   ~/.dots/my-app/
   ├── .config/my-app/
   │   └── config.json
   └── .local/bin/
       └── my-app-helper
   ```

3. **Enable the package:**

   ```sh
   make add config=my-app
   ```

### Adding Post-Install Scripts

If your package needs additional setup (installing dependencies, compiling software, etc.):

1. **Create the script in the stow-run.d directory:**

   ```sh
   ~/.dots/my-app/.local/stow-run.d/my-app.sh
   ```

2. **Make it executable:**

   ```sh
   chmod +x ~/.dots/my-app/.local/stow-run.d/my-app.sh
   ```

3. **Run the configuration:**

   ```sh
   make configure
   ```

**Example script (`my-app.sh`):**
```sh
#!/usr/bin/env bash

# Install dependencies
if command -v apt-get &>/dev/null; then
    sudo apt-get install -y some-dependency
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm some-dependency
fi

# Perform additional setup
echo "My-app post-install setup complete"
```

### Adopting Existing Configurations

If you already have configuration files in your home directory and want to bring them under stow management:

```sh
make adopt-config config=<package_name>
```

This will:
1. Stow the package with the `--adopt` flag
2. Move existing files into the package directory
3. Create symlinks back to their original locations

## Troubleshooting

### Common Issues

**Issue: `stow` command not found**

```sh
# Install stow manually for your distribution
sudo apt-get install stow          # Debian/Ubuntu
sudo pacman -S stow                # Arch
sudo dnf install stow              # Fedora
brew install stow                  # macOS
```

**Issue: Symlink conflicts**

If stow reports conflicts, it means files already exist in the target location that aren't symlinks.

```sh
# Check what's conflicting
ls -la ~/.config/app

# Option 1: Remove existing files
rm ~/.config/app/some-file

# Option 2: Move existing files into the package
make adopt-config config=app
```

**Issue: Changes not reflected after modifying files**

After modifying files within a package, refresh the symlinks:

```sh
make update
```

**Issue: `make configure` doesn't run scripts**

Ensure the script is executable:

```sh
chmod +x ~/.dots/package/.local/stow-run.d/package.sh
```

**Issue: Package already enabled**

The `make add` command checks if a package is already enabled. If you want to force a reinstall:

```sh
make update
```

### Debugging

**Enable verbose output:**

The Makefile uses `stow -v` by default, showing all symlink operations.

**Check enabled packages:**

```sh
make enabled
```

**Verify symlinks:**

```sh
# Check if a file is a symlink and what it points to
ls -la ~/.config/nvim/init.lua

# Should show something like:
# .config/nvim/init.lua -> /home/user/.dots/nvim/.config/nvim/init.lua
```

**Manual stow check:**

```sh
# Check what stow would do without making changes
stow -nv --target=$HOME package-name
```

## Advanced Usage

### Selective Installation

Instead of enabling all packages, you can selectively install only what you need:

```sh
# Only install zsh on a minimal system
make add config=zsh

# Later, add more as needed
make add config=nvim
```

### Environment-Specific Configurations

You can use separate stow.env files for different machines:

```sh
# On a desktop machine
echo "export stow_configs=zsh,nvim,hyprland" > ~/.zenv.d/stow.env

# On a server
echo "export stow_configs=zsh,tmux,git" > ~/.zenv.d/stow.env
```

### Using Stow Directly

For advanced usage, you can use stow directly:

```sh
# Stow a package
stow -Sv --target=$HOME package-name

# Unstow a package
stow -Dv --target=$HOME package-name

# Restow (update symlinks)
stow -Rv --target=$HOME package-name

# Dry run (see what would happen)
stow -nv --target=$HOME package-name
```

### Managing Multiple Dotfile Repositories

You can maintain multiple dotfile repositories by:

1. Cloning them to different locations
2. Using different stow targets or package prefixes
3. Creating separate stow.env files for each

## Contributing

When contributing to this repository:

1. Follow the existing directory structure
2. Keep package-specific files isolated to their respective directories
3. Test changes with `make update` before committing
4. Ensure any scripts in `.local/bin/` are executable
5. Document complex configurations with comments in config files

## License

This repository follows the license specified in the repository.
