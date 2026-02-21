# Agent Guidelines for Dotfiles Repository

This repository manages user configuration files (dotfiles) using **GNU Stow** and a **Makefile** workflow.
Agents operating here must adhere to the directory structure and use the provided Make commands to ensure consistency.

## 1. Build, Install, and Test Commands

There is no compilation build step. "Building" refers to symlinking configurations to the user's home directory.

### Core Workflow Commands
* **Install/Enable a Config:**
  ```bash
  make add config=<package_name>
  ```
  * *Example:* `make add config=zsh`
  * *Effect:* Symlinks contents of `./zsh/` to `$HOME/` and adds it to the enabled list.

* **Update/Refresh Symlinks:**
  ```bash
  make update
  ```
  * *Use when:* You have added, removed, or renamed files within an existing package.
  * *Effect:* Restows all enabled packages.

* **Remove/Disable a Config:**
  ```bash
  make rm config=<package_name>
  ```

* **Run Post-Install Configuration:**
  ```bash
  make configure
  ```
  * *Effect:* Executes setup scripts located in `~/.local/stow-run.d/`.

### Testing & Verification
"Testing" in this context means verifying symlink integrity and configuration syntax.

* **Test a Single Package (Dry Run):**
  To simulate what `stow` will do without applying changes (useful for checking conflicts):
  ```bash
  stow -n -v --target=$HOME <package_name>
  ```

* **Verify Shell Scripts:**
  Run `shellcheck` on any new or modified scripts:
  ```bash
  shellcheck <package>/.local/bin/<script_name>
  ```

* **Verify Lua (Neovim):**
  If modifying Neovim config, check for syntax errors:
  ```bash
  luacheck <package>/.config/nvim/
  ```

## 2. Code Style & Structure Guidelines

### Directory Structure (Stow Protocol)
* **Concept:** Each top-level directory is a **package**. Its contents map 1:1 to `$HOME`.
* **Rule:** Do NOT put config files at the root of a package unless they belong in `~`.
  * *Bad:* `nvim/init.lua` (would link to `~/init.lua`)
  * *Good:* `nvim/.config/nvim/init.lua` (links to `~/.config/nvim/init.lua`)

### File Placement Standards
* **User Binaries:** Place executable scripts in `<package>/.local/bin/`.
  * *Example:* `scripts/.local/bin/my-script`
* **Setup Hooks:** Place post-install scripts in `<package>/.local/stow-run.d/<package>.sh`.
  * *Example:* `zsh/.local/stow-run.d/zsh.sh` (e.g., for installing plugins).

### Language-Specific Guidelines

#### Shell Scripts (Bash/Zsh)
* **Shebang:** Must be present. Use `#!/usr/bin/env bash` or `#!/usr/bin/env zsh`.
* **Safety:** Start standalone scripts with `set -euo pipefail` to catch errors early.
* **Quoting:** Always double-quote variables (e.g., `"${VAR}"`) to handle paths with spaces.
* **Naming:** Use `kebab-case` for script filenames (e.g., `install-fonts.sh`).
* **Idempotency:** Setup scripts (`stow-run.d`) MUST be idempotent. They should be safe to run multiple times without side effects.

#### Lua (Neovim/AwesomeWM)
* **Formatting:** Use 2-space indentation.
* **Globals:** Avoid global variables; use `local`.
* **Style:** Prefer `pcall` for requiring optional modules to prevent startup crashes.

#### Configuration Files (JSON, YAML, TOML)
* **Indentation:** 2 spaces is preferred for consistency.
* **Comments:** Heavily comment "magic" values or workarounds. Explain *why*, not just *what*.

### Error Handling
* **Make Commands:** The Makefile checks for environment variables. If `make` fails, check `~/.zenv.d/stow.env`.
* **Conflict Resolution:** If `stow` reports a conflict:
  1. Check if the target file is a real file (not a symlink).
  2. If it's a real file, back it up or delete it (ask user first).
  3. Run `make update` again.

## 3. Agent Workflow
1. **Discovery:** Before creating a new config, check if a package already exists (e.g., `ls -d */`).
2. **Creation:**
   * Create the package directory: `mkdir -p <name>/.config/<name>`
   * Add files.
   * Enable it: `make add config=<name>`
3. **Modification:**
   * Edit files directly in the package directory.
   * If adding new files, run `make update` to link them.
4. **Validation:**
   * Always check `stow -n -v ...` if unsure about path mapping.
