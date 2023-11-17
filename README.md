# NixOS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is paranoid build with root on `tmpfs`,
as described in my [Privacy Basic Guide](https://realeinherjar.github.io/privacy).
This means that everything outside of some directories of `/etc` and some directories of `/home` will be wiped out.
Read more about this in the [NixOs Paranoid Guide](https://xeiaso.net/blog/paranoid-nixos-2021-07-18)
(this is also a good source [NixOS `tmpfs` as `/home`](https://elis.nu/blog/2020/06/nixos-tmpfs-as-home/)).

![screenshot](screenshot.png)

## Features

- [`Hyprland`](https://github.com/hyprwm/Hyprland) Wayland window manager:

  - [`Waybar`](https://github.com/Alexays/Waybar) status bar.
  - [`Nemo`](https://github.com/linuxmint/nemo) file manager.
  - [`Rofi-wayland`](https://github.com/lbonn/rofi) application launcher.
  - [`Mako`](https://github.com/emersion/mako) notification daemon.
  - [`Swaylock-effects`](https://github.com/mortie/swaylock-effects) screen locker.
  - [`NetworkManager`](https://networkmanager.dev/) network management tool.
  - [`Nerdfonts`](https://github.com/ryanoasis/nerd-fonts).

- [`foot`](https://codeberg.org/dnkl/foot) CLI-ready workflow with
  [`fish`](https://github.com/fish-shell/fish-shell),
  [`tmux`](https://github.com/tmux/tmux),
  [`git`](https://git-scm.com/),
  [`fish`](https://fishshell.com/),
  [`gpg`](https://gnupg.org/),
  [`ssh`](https://www.openssh.com/),
  [`curl`](https://curl.se/),
  [`rsync`](https://rsync.samba.org/),
  and power tools like
  [`bat`](https://github.com/sharkdp/bat),
  [`zoxide`](https://github.com/ajeetdsouza/zoxide),
  [`eza`](https://eza.rocks/),
  [`bottom`](https://clementtsang.github.io/bottom),
  [`broot`](https://dystroy.org/broot/),
  [`fzf`](https://github.com/junegunn/fzf),
  [`yazi`](https://yazi-rs.github.io/),
  [`ripgrep`](https://github.com/BurntSushi/ripgrep),
  [`fd`](https://github.com/sharkdp/fd),
  [`jq`](https://jqlang.github.io/jq/),
  [`just`](https://just.systems/),
  [`lazygit`](https://github.com/jesseduffield/lazygit),
  [`lazydocker`](https://github.com/jesseduffield/lazydocker),
  [`gh`](https://cli.github.com/),
  and more...
- Developer-ready languages:
  [Nix](https://nixos.org/),
  [Rust](https://rust-lang.org/),
  [Go](https://go.dev/),
  [Python](https://python.org/),
  and [LLVM](https://llvm.org/).
- Easy to develop environments with
  [`nix-shell`](https://nixos.org/manual/nix/stable/command-ref/nix-shell.html)
  [`direnv`](https://direnv.net/),
  and [`devshell`](https://numtide.github.io/devshell/).
  You can put your soydev TypeScript/JavaScript/NodeJS stuff here.
- Text editor with [Helix](https://helix-editor.com/) enabled with the following [LSP](https://langserver.org/)s:

  - [`nil`](https://github.com/oxalica/nil): Nix
  - [`bash-language-server`](https://github.com/bash-lsp/bash-language-server): Bash, Fish, Zsh, shell scripts, etc.
  - [`rust-analyzer`](https://rust-analyzer.github.io/): Rust
  - [`gopls`](https://pkg.go.dev/golang.org/x/tools/gopls): Go
  - [`taplo`](https://taplo.tamasfe.dev/): TOML
  - [`yaml-language-server`](https://github.com/redhat-developer/yaml-language-server): YAML
  - [`ruff-lsp`](https://github.com/astral-sh/ruff-lsp): Python
  - [`marksman`](https://github.com/artempyanykh/marksman): Markdown
  - [`vscode-langservers-extracted`](https://github.com/hrsh7th/vscode-langservers-extracted): HTML, CSS, and JSON
  - [`texlab`](https://github.com/latex-lsp/texlab): $\LaTeX$
  - [`ltex-ls`](https://github.com/valentjn/ltex-ls): [LanguageTool](https://languagetool.org/) for Markdown, HTML, and $\LaTeX$.
  - [`typst-lsp`](https://github.com/nvarner/typst-lsp): Typst

- [Catppuccin](https://catppuccin.com) Mocha theme everywhere.
- Archival tools:
  [`gzip`](https://www.gnu.org/software/gzip/),
  [`xz`](https://tukaani.org/xz/),
  `zip`,
  [`lz4`](https://github.com/lz4/lz4),
  [`p7zip`](https://7-zip.org/),
  and [`zstd`](https://facebook.github.io/zstd/).
- CLI entertainment tools:
  [`mpv`](https://mpv.io/),
  [`yt-dlp`](https://github.com/yt-dlp/yt-dlp),
  [`cmus`](https://cmus.github.io/),
  and [`ffmpeg`](https://ffmpeg.org/).
- VPN support with [`wireguard`](https://www.wireguard.com/)
- Keyboard customizations with [`keyd`](https://github.com/rvaiya/keyd):
  Caps Lock as Escape (if tapped) and Control (if held).
- Publishing and content CLI tools:
  [`qpdf`](https://github.com/qpdf/qpdf),
  [`pandoc`](https://pandoc.org/),
  [`glow`](https://github.com/charmbracelet/glow),
  [`graphicsmagick`](http://www.graphicsmagick.org/),
  [`tectonic`](https://tectonic-typesetting.github.io/),
  and [`typst`](https://typst.app/).
- OS-level adblocking with [`StevenBlack/hosts`](https://github.com/StevenBlack/hosts)
  in the `/etc/hosts`.
- Apps:

  - Bitcoin tools such as [Sparrow wallet](https://sparrowwallet.com/) and [Bisq](https://bisq.network/)
  - Encrypted backup tool with [Cryptomator](https://cryptomator.org/)
  - [Signal messenger](https://signal.org/)
  - [Firefox](https://www.mozilla.org/firefox/) with [Tor Browser](https://www.torproject.org/) also available
  - Torrenting with [Transmission](https://transmissionbt.com/)
  - Docker and Linux VMs with [Podman](https://podman.io/) and [QEMU](https://www.qemu.org/)
  - Offline password manager with [KeePassXC](https://keepassxc.org/)
  - Screen Recorder with [OBS Studio](https://obsproject.com/)

## How to Install

1. Prepare a [64-bit NixOS 23.11 minimal iso image](https://channels.nixos.org/nixos-23.11/latest-nixos-minimal-x86_64-linux.iso) and burn it, then enter the live system.
   Suppose I have divided two partitions: `/dev/nvme0n1p1` and `/dev/nvme0n1p2`
1. Format the partitions:

   ```bash
   mkfs.fat -F 32 /dev/nvme0n1p1
   mkfs.ext4 /dev/nvme0n1p2 # or use LUKS with cryptsetup luksFormat /dev/nvme0n1p2 encryptedroot
   ```

1. Mount:

   ```bash
   mount -t tmpfs none /mnt
   mkdir -p /mnt/{boot,nix,etc/nixos}
   mount /dev/nvme0n1p2 /mnt/nix # or LUKS with mount /dev/mapper/encryptedroot /mnt/nix
   mount /dev/nvme0n1p1 /mnt/boot
   mkdir -p /mnt/nix/persist/etc/nixos
   mount -o bind /mnt/nix/persist/etc/nixos /mnt/etc/nixos
   ```

1. Generate a basic configuration:

   ```bash
   nixos-generate-config --root /mnt
   ```

1. Clone the repository locally:

   ```bash
   nix-shell -p git
   # recursive for git submodules
   git clone --recursive https://github.com/realeinherjar/flakes.git /mnt/etc/nixos/flakes
   cd /mnt/etc/nixos/flakes/
   nix develop --extra-experimental-features "nix-command flakes" --extra-experimental-features flakes
   ```

1. Copy `hardware-configuration.nix` from `/mnt/etc/nixos` to `/mnt/etc/nixos/flakes/hosts/laptop/hardware-configuration.nix`:

   ```bash
   cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/flakes/hosts/laptop/hardware-configuration.nix
   ```

1. Modify the overwritten `hardware-configuration.nix`:

   ```bash
   hx /mnt/etc/nixos/flakes/hosts/laptop/hardware-configuration.nix
   ```

   ```nix
   ...
   # This is just an example
   # Please refer to `https://elis.nu/blog/2020/05/nixos-tmpfs-as-root/#step-4-1-configure-disks`

     fileSystems."/" =
       { device = "none";
         fsType = "tmpfs";
         options = [ "defaults" "size=12G" "mode=755"  ];
       };

     fileSystems."/nix" =
       { device = "/dev/disk/by-uuid/49e24551-c0e0-48ed-833d-da8289d79cdd";
         fsType = "ext4";
       };

     fileSystems."/boot" =
       { device = "/dev/disk/by-uuid/3C0D-7D32";
         fsType = "vfat";
       };

     fileSystems."/etc/nixos" =
       { device = "/nix/persist/etc/nixos";
         fsType = "none";
         options = [ "bind" ];
       };
   ...
   ```

1. remove `/mnt/etc/nixos/flakes/.git`:

   ```bash
   rm -rf .git
   ```

1. Username modification: edit `/mnt/etc/nixos/flakes/flake.nix` to modify **user** variable, hostname modification: edit `/mnt/etc/nixos/flakes/hosts/system.nix` to modify the **hostName** value in the **networking** property group

1. Use the hash password generated by the `mkpasswd {PASSWORD} -m sha-512` command to replace the value of `users.users.<name>.hashedPassword` in `/mnt/etc/nixos/flakes/hosts/laptop/wayland/default.nix` (there are two places to be edited)

1. Perform install:

   ```bash
   nixos-install --no-root-passwd --flake .#laptop
   ```

1. Reboot

   ```bash
   reboot
   ```

1. Enjoy it!

## How to Update

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
   doas nixos-rebuild boot --flake .#<hostname>
   ```
