#  Specific home-manager configuration settings for NixOS
#
#  flake.nix
#   └─ home-manager
#      ├─ default.nix
#      └─ linux.nix *
#

{ config, pkgs, vars, ... }:

{
  home = {
    homeDirectory = "/home/${vars.user}";

    # Wallpapers
    file."wallpaper".source = ../hosts/wallpaper;
  };
}
