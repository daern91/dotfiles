# Taps
tap "homebrew/autoupdate"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"
tap "stripe/stripe-cli"
tap "supabase/tap"

# --- CLI Tools ---
# Note: Python is NOT listed here - it's auto-installed as a dependency
# by packages that need it (awscli, thefuck). Use uv for project Python.

# Shell & Terminal
brew "fzf"                          # Fuzzy finder
brew "atuin"                        # Shell history with search and sync
brew "starship"                     # Cross-shell prompt
brew "tmux"                         # Terminal multiplexer
brew "zsh-autosuggestions"          # Fish-like autosuggestions for zsh
brew "zoxide"                       # Smarter cd command
brew "thefuck"                      # Correct mistyped commands

# File & Text Tools
brew "bat"                          # cat with syntax highlighting
brew "eza"                          # Modern ls replacement
brew "fd"                           # Modern find replacement
brew "ripgrep"                      # Modern grep replacement
brew "sd"                           # Intuitive find & replace
brew "yazi"                         # Terminal file manager
brew "jq"                           # JSON processor
brew "yq"                           # YAML/JSON/XML processor
brew "rename"                       # Batch file rename

# Development
brew "git"                          # Version control
brew "git-flow"                     # Git branching model
brew "gh"                           # GitHub CLI
brew "neovim"                       # Text editor
brew "cmake"                        # Build system
brew "fnm"                          # Fast Node.js version manager
brew "pnpm"                         # Fast Node.js package manager

# Cloud & Infrastructure
brew "awscli"                       # AWS CLI
brew "doctl"                        # DigitalOcean CLI
brew "eksctl"                       # AWS EKS CLI
brew "helm"                         # Kubernetes package manager
brew "kubernetes-cli"               # kubectl
brew "tfenv"                        # Terraform version manager
brew "stripe/stripe-cli/stripe"     # Stripe CLI
brew "supabase/tap/supabase"        # Supabase CLI

# Networking & Security
brew "gnupg"                        # GPG encryption
brew "nmap"                         # Network scanner
brew "wget"                         # File retriever
brew "ykman"                        # YubiKey manager

# Media
brew "ffmpeg"                       # Audio/video processing
brew "media-info"                   # Media file metadata

# Data & Monitoring
brew "redis"                        # Key-value database
brew "libpq", link: true            # Postgres C API
brew "bottom"                       # System monitor
brew "dust"                         # Disk usage analyzer
brew "k6"                           # Load testing
brew "kcat"                         # Kafka CLI
brew "oha"                          # HTTP load generator
brew "watch"                        # Periodic command execution

# Misc
brew "grep"                         # GNU grep
brew "tealdeer"                     # tldr pages client

# --- GUI Applications (Casks) ---
cask "ghostty"                      # Terminal emulator (auto-updates)
cask "iina"                         # Media player (auto-updates)
cask "ngrok"                        # Reverse proxy tunnels
cask "rectangle"                    # Window management
cask "gcloud-cli"                   # Google Cloud SDK

# --- Installed natively (NOT in Brewfile) ---
# claude-code:  curl -fsSL https://claude.ai/install.sh | bash
# uv (Python):  curl -LsSf https://astral.sh/uv/install.sh | sh
# rust/cargo:   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
