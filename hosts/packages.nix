#  Specific packages for NixOS
#
#  flake.nix 
#   └─ ./hosts  
#       ├─ default.nix
#       └─ packages.nix *
#
{ config, pkgs, vars, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      glib
      xdg-utils
      pciutils
      killall
      socat
      zathura
      cryptomator
      wireguard-tools
      openresolv
      mullvad-vpn
    ];
  };
}
