#  Specific system configuration settings for MacBook
#
#  flake.nix
#   └─ ./darwin
#       ├─ default.nix
#       ├─ macbook.nix
#       └─ brew.nix *
#
{ config, pkgs, vars, ... }:

{
  homebrew = {
    # Homebrew Package Manager
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    taps = [
      "macos-fuse-t/homebrew-cask"
    ];
    brews = [
    ];
    casks = [
      "android-file-transfer"
      "bisq"
      "brave-browser"
      "cryptomator"
      "docker"
      "iina"
      "fuse-t"
      "obs"
      "protonvpn"
      "signal"
      "sparrow"
      "tor-browser"
      "transmission"
      "utm"
      "visual-studio-code"
    ];
  };
}
