# Dotfiles

My personal dotfiles for macOS, managed with [dotbot](https://github.com/anishathalye/dotbot).

## Quick Start

```bash
# Clone the repository
git clone https://github.com/daern91/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install dotfiles (creates symlinks)
./install

# Install Homebrew packages
brew bundle install

# Install tools that use native installers
curl -fsSL https://claude.ai/install.sh | bash        # Claude Code
curl -LsSf https://astral.sh/uv/install.sh | sh       # uv (Python)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Rust

# Start Homebrew auto-updates (runs every 24h in background)
brew autoupdate start --upgrade --cleanup
```

## What's Included

### Configuration Files
- **Ghostty** - Terminal emulator config
- **Neovim** - init.lua configuration
- **Vim** - .vimrc configuration
- **Tmux** - Terminal multiplexer config
- **Zsh** - Shell configuration with aliases and functions
- **Git** - Global git configuration

### Applications & Tools (via Brewfile)

- **Shell**: fzf, atuin, starship, tmux, zoxide, zsh-autosuggestions
- **File tools**: bat, eza, fd, ripgrep, sd, yazi, jq, yq
- **Dev tools**: git, gh, neovim, fnm, pnpm, cmake
- **Cloud/Infra**: awscli, doctl, eksctl, helm, kubectl, tfenv, stripe, supabase
- **Applications**: Ghostty, IINA, Rectangle, ngrok

### Native Installs (not in Brewfile)

These tools work best with their own installers:

- **Claude Code**: `curl -fsSL https://claude.ai/install.sh | bash` (auto-updates)
- **uv (Python)**: `curl -LsSf https://astral.sh/uv/install.sh | sh` (auto-updates)
- **Rust/Cargo**: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh` (update with `rustup update`)

### Auto-Updates

- **Homebrew CLI tools**: Updated every 24h via `homebrew-autoupdate`
- **Ghostty, IINA**: Auto-update themselves (marked `auto_updates` in brew)
- **Claude Code, uv**: Self-updating via native installers
- **Rust**: Manual update via `rustup update`

## Setting Up a New Machine

1. **Install Homebrew**:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Clone and install dotfiles**:
   ```bash
   git clone https://github.com/daern91/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ./install
   ```

3. **Install Homebrew packages**:
   ```bash
   brew bundle install
   ```

4. **Install native tools**:
   ```bash
   curl -fsSL https://claude.ai/install.sh | bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

5. **Start auto-updates**:
   ```bash
   brew autoupdate start --upgrade --cleanup
   ```

6. **Create `variables.sh`** (referenced in .zshrc):
   ```bash
   cp ~/variables.sh.example ~/variables.sh
   # Edit with your personal variables/secrets
   ```

## Updating

### Update dotfiles
```bash
cd ~/.dotfiles
git pull
./install
```

### Update Homebrew packages
```bash
# Manual update (or let autoupdate handle it automatically)
brew update && brew upgrade
```

### Update Rust
```bash
rustup update
```

## Structure

```
.
├── Brewfile              # Homebrew packages and applications
├── install.conf.yaml     # Dotbot configuration
├── .zshrc                # Zsh configuration
├── .vimrc                # Vim configuration
├── .tmux.conf            # Tmux configuration
├── .gitconfig            # Git configuration
├── ghostty.config        # Ghostty terminal config
├── init.lua              # Neovim configuration
└── variables.sh          # Personal variables (not tracked)
```

## Notes

- Paths use `$HOME` for portability across machines
- `variables.sh` should contain personal/secret variables and is not tracked in git
- Homebrew auto-update runs every 24h in the background via launchd
- Tools with native installers are NOT in the Brewfile to avoid conflicts
