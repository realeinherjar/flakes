# NixOS

These are my NixOS/MacOS setup.

## Features

- Alacritty CLI-ready workflow with `tmux`, `git`, `fish`, `gpg`, `ssh`, `curl`, `rsync`,
   and power tools like
   `bat`, `zoxide`, `eza`, `btop`, `broot`, `fzf`, `yazi`, `ripgrep`, `fd`, `jq`,
   `just`, `lazygit`, `gh`, and more...
- Developer-ready languages: Nix, Rust, Go, Python, LLVM, NodeJS, and TypeScript/JavaScript.
- Text editor with Helium enabled with the following LSPs:

  - `nil`: Nix
  - `bash-language-server`: bash, fish, zsh, sh, ect..
  - `rust-analyzer`: Rust
  - `typescript-language-server`: TypeScript and JavaScript
  - `taplo`: TOML
  - `yaml-language-server`: YAML
  - `ruff-lsp`: Python
  - `marksman`: Markdown
  - `vscode-langservers-extracted`: HTML and CSS

- Catppuccin Mocha theme everywhere.
- Nix-themed wallpaper.
- Archival tools: `gzip`, `xz`, `zip`, `lz4`, `p7zip`, and `zstd`.
- CLI entertainment tools: `yt-dlp`, `cmus`, `mpv`, and `ffmpeg`.
- Publishing and content CLI tools: `qpdf`, `pandoc`, `graphicsmagick`,
   `tectonic`, and `typst`.
- OS-level adblocking with [`StevenBlack/hosts`](https://github.com/StevenBlack/hosts)
   in the `/etc/hosts`.
- Bitcoin tools such as Sparrow wallet and Bisq
- Encrypted backup tool with Cryptomator
- Signal messenger
- Brave as the default browser with Tor Browser also available
- Torrenting with Transmission
- Docker
- Android file transfer support

## MacOS

The MacOS configs are minimalist in approach
and geared towards enhancing security and privacy.
It uses the best practices described in the [MacOS Hardening Guide](https://github.com/ataumo/macos_hardening)
and the [MacOS Security and Privacy Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide).

MacOS specific features:

- Firewall
- Sharing disable
- Common developer enhancements in Finder and Search
- Dark Mode by default
- Minimalist Dock
- ProtonVPN
- UTM for managing and running VMs natively

### Prepare your system

Before installing anything you'll need to prepare your system:

1. Don't register an Apple ID
1. Enable Lockdown Mode
1. Disable all Sharing stuff: General > Sharing: Disable All
1. Disable Notifications previews:
   - Notifications > Show Previews: Never
   - Notifications: Disable "Allow notifications when the screen is locked"
   - Lock Screen > Require password immediately
1. Change NTP Server: General > Date & Time > Source: Change to "pool.ntp.org"
1. Set the smart battery saver: Boost mode on AC and Low Power mode on battery
1. Disable Siri:
   - Siri and Spotlight: Disable "Ask Siri"
   - Siri and Spotlight > Siri Suggestions > Disable all
1. Disable Analytics:
   - Privacy and Security > Analytics > Improvements: Disable all
   - Privacy and Security > Apple Advertising > Disable personalized ads
   - Game Center: Disable all

### How to Install

1. Install Nix using the [DeterminateSystems installer](https://github.com/DeterminateSystems/nix-installer#the-determinate-nix-installer):
   
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

1. Install [`nix-darwin`](https://github.com/LnL7/nix-darwin):

   ```bash
   nix run nix-darwin -- switch --flake .
   ```

1. Apply changes to your system:

   ```bash
   darwin-rebuild switch --flake .
   ``` 

### How to Update

1. First, update the input in `flake`:

   ```bash
   # update the specified input
   nix flake lock --update-input <foo> <foo>
   # or update all inputs
   nix flake update
   # also you can reclaim storage with
   nix-collect-garbage -d
   ```

1. Then, rebuild and switch to the system after rebuild:

   ```bash
   darwin-rebuild switch --flake .
   ```

## NixOS

TODO: 

## LICENSE

TODO: