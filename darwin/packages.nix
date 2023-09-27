#
#  Specific system configuration settings for MacBook
#
#  flake.nix
#   └─ ./darwin
#       ├─ default.nix
#       ├─ macbook.nix
#       └─ packages.nix *
#
{ config, pkgs, vars, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # Mac-specific packages
      pinentry_mac
    ];
  };
}
