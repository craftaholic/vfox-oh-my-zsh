# vfox-oh-my-zsh

Oh My Zsh framework plugin for [vfox](https://vfox.dev/).

## Install

After installing [vfox](https://vfox.dev/), add the plugin by running:

```vfox add oh-my-zsh /path/to/vfox-oh-my-zsh```

List available versions:

```vfox available oh-my-zsh
```

Install a specific version:

```vfox install oh-my-zsh@<tag>
```

Switch to a different version:

```vfox use oh-my-zsh@<tag>
```

Remove a specific version:

```vfox remove oh-my-zsh@<tag>
```

## Version Management

This plugin uses git tags as versions. You can pin to a specific tag for stable versions, or use a commit SHA for bleeding edge builds.

### Commit SHAs as Version Identifiers

Version identifiers follow the format: `YYYY-MM-DDTHHMM` (e.g., 2025-04-06T14:30:00).

### Commit SHA Pinning

For specific commits, you can use the full 40-character SHA or the first 8 characters of the abbreviated SHA:
- Full SHA: `a1b2c3d4e5f6...` (exact commit hash)
- Abbreviated SHA: `a1b2c3d4f...` (first 8 chars)

### How It Works

### Available Versions
Tags represent official Oh My Zsh releases. Each tag is a version of the rolling framework.

### Installation Process

When you install a version:
1. Plugin clones Oh My Zsh repository to a versioned directory
2. Creates a symlink at `~/.oh-my-zsh` pointing to the versioned directory
3. The install script runs manually after symlink is created

### Symlink Management

The plugin manages a symlink at `~/.oh-my-zsh` that points to the currently active versioned installation. When you switch versions, the symlink is updated to point to the new versioned directory.

### Environment Configuration

The `env_keys.lua` hook returns an empty table because Oh My Zsh install script handles its own configuration. No additional environment variables are needed.

---

## Usage Examples

Add plugin to vfox locally:
```bash
vfox add oh-my-zsh /path/to/vfox-oh-my-zsh
```

List available versions:
```bash
vfox available oh-my-zsh
```

Install latest version:
```bash
vfox install oh-my-zsh@latest
```

Install a specific commit:
```bash
vfox install oh-my-zsh@a1b2c3d4e5f...
```

Use installed version:
```bash
vfox use oh-my-zsh@a1b2c3d4e5f...
```

Switch to a different version:
```bash
vfox use oh-my-zsh@a1b2c3d4e5f...
```

### Commit SHA Pinning

For specific commits, you can use the full or abbreviated SHA:

```vfox install oh-my-zsh@<sha>
```

## How It Works

### Available Versions

Versions are fetched using the GitHub API from the [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) repository. Tags in the format `v*` are treated as available versions.

### Installation Process

When you install a version, the post_install hook:

1. Clones the Oh My Zsh repository to a versioned directory
2. Creates a symlink at `~/.oh-my-zsh` pointing to the versioned directory
3. The install script runs manually after the symlink is created

### Symlink Management

The plugin manages a symlink at `~/.oh-my-zsh` that points to the currently active versioned installation. When you switch versions, the symlink is updated to point to the new versioned directory.

### Environment Configuration

The `env_keys.lua` is minimal because the Oh My Zsh install script handles its own configuration. The install script will configure your `.zshrc` on first use.

## Example Workflow

```bash
# Add the plugin
vfox add oh-my-zsh /path/to/vfox-oh-my-zsh

# List available versions
vfox available oh-my-zsh

# Install a specific version
vfox install oh-my-zsh@v1.0.0

# Use the installed version
vfox use oh-my-zsh@v1.0.0

# Switch to a different version later
vfox install oh-my-zsh@latest
vfox use oh-my-zsh@latest
```

## Notes

- After installing or switching versions, you must restart your shell or source your `.zshrc`:
  ```zsh
  source ~/.zshrc
  ```
- The install script will configure `.zshrc` on first use
- Existing `~/.oh-my-zsh` installations will be detected and you will be warned during installation
- For more information about Oh My Zsh, visit [ohmyz.sh](https://ohmyz.sh/)
