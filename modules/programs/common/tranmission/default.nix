{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      transmission-gtk
    ];
  };
  # networking.firewall.allowedTCPPorts = [ 51413 ];
}
