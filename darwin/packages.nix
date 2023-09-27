#  Specific packages for MacOS
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
      pinentry_mac
    ];
  };
}
